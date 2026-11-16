unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Math, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Clipbrd,
  StrUtils,
  uPlot2,
  myMath, Vcl.CheckLst
  ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    Memo4: TMemo;
    Label4: TLabel;
    Memo3: TMemo;
    Label5: TLabel;
    Input: TLabel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Label6: TLabel;
    Edit12: TEdit;
    Label7: TLabel;
    Edit13: TEdit;
    Label8: TLabel;
    Edit14: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckListBox1: TCheckListBox;
    Memo1: TMemo;
    CheckBox12: TCheckBox;
    Edit15: TEdit;
    Button7: TButton;
    Button8: TButton;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    Button9: TButton;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



// ====== Units of Measurement used in the model =================
{mM = mmol/L: concentration,
ms: time,
mV: voltage,
pA: electric current,
pF: electric capacitance,
nS: electric conductance
picoliters: volumes of cell compartments.
}



// ============== CONSTANTS and VARIABLES =========================

// -------------- ELECTROPHYSIOLOGY ---------------------
const
Cm=32;  //  Cell membrane electric capacitance, pF


var
Vm,     // Membrane potential, mV
Im,     // Net membrane current, pA
dVdt,   // dV/dt, mV/ms

// Membrane ion currents, pA
ICaL,   //  L-type Ca2+  current
ICaT,   //  T-type Ca2+  current
I_f,     //  Hyperpolarization-activated "funny" current: I_f = IhNa + IhK:
IKr,    //  Rapid component of the delayed rectifier K+ current
IKs,    //  Slow component of the delayed rectifier K+ current
INCX,   //  Na+/Ca2+ exchanger current
INaK,   //  Na+-K+ pump current
Ist,    //  Sustained inward current
Isus,   //  Sustained component of the 4-AP-sensitive current
Ito,    //  Transient component of the 4-AP-sensitive current
IbNa,   //  Background Na+ current
IbCa,    //  Background Ca2+ current


IhNa,   //  Na+ part of I_f
IhK,    //  K+ part of I_f
ItoIsus,//  Ito + Isus

// Voltage dependent activation of I_f
V_Ih12   // half activation voltage for I_f, mV
:double;



//  Gating variables for membrane currents:
var
dL,     // Activation gating variable for ICaL
dT,     // Activation gating variable for ICaT
fCa_,   // Ca2+ dependent inactivation gating variable for ICaL
fL,     // Voltage-dependent inactivation gating variable for ICaL
fT,     // Inactivation gating variable for ICaT
n,      // Activation gating variable for IKs
paF,    // Fast activation gating variable for IKr
paS,    // Slow activation gating variable for IKr
pi_,    // Inactivation gating variable for IKr
q,      // Inactivation gating variable for Ito
qi,     // Inactivation gating variable for Ist
r,      // Activation gating variable for Ito and Isus
y,      // Activation gating variable for Ih
qa,     // Activation gating variable for Ist

// Time constants for gating variables
tau_dL,  tau_dT,  tau_fCa,   tau_fL,  tau_fT,  tau_n,
tau_paF,   tau_paS,   tau_pi,  tau_q,  tau_qa,  tau_qi,  tau_r,  tau_y,

// Opening and closing rates for channel gating
alfa_dL, alfa_qa, alfa_qi, alfa_n, beta_dL, beta_n, beta_qa, beta_qi,

// steady state curves
dL_inf, dT_inf, fCa_inf, fL_inf, fT_inf, n_inf, pa_inf,
pi_inf, q_inf, qa_inf, qi_inf, r_inf, y_inf,

//  ion conductances, nS/pF
gbNa, // Background Na+ conductance
gCaL, // Maximum ICaL conductance
gCaT, // Maximum ICaT conductance
GbCa, // Conductance for background Ca2+ current
gh,   // Maximum Ih conductance
gKr,  // Maximum IKr conductance
gKs,  // Maximum IKs conductance
gst,  // Maximum Ist conductance
gsus, // Maximum Isus conductance
gto,  // Maximum Ito conductance

// ion currents scaling factors
INaKmax,//  Maximum INaK, pA/pF
kNCX: //Scaling factor for INCX, pA/pF
double;
// ----------- Modulation of ion currents by ions ------------------
const
KmfCa=0.00035;// Dissociation constant of Ca-dependent ICaL inactivation, mM
KmKp=1.4;     // Half-maximal [K+]o for INaK, mM
KmNap=14;     // Half-maximal [Na+]i for INaK, mM
beta_fCa=60;  // Ca2+ association rate constant for ICaL,  mM^-1 � ms^-1
alfa_fCa=0.021; // Ca2+ dissociation rate constant for ICaL, 1/ms

// Dissociation constants for NCX, mM:
const
K1ni=395.3; //intracellular Na+ binding to first site on NCX
K2ni=2.289; //intracellular Na+ binding to second site on NCX
K3ni=26.44; //intracellular Na+ binding to third site on NCX
K1no=1628;  //extracellular Na+ binding to first site on NCX
K2no=561.4; //extracellular Na+ binding to second site on NCX
K3no=4.663; //extracellular Na+ binding to third site on NCX
Kci=0.0207; //intracellular Ca2+ binding to NCX transporter
Kco=3.663;  //extracellular Ca2+ binding to NCX transporter
Kcni=26.44; //intracellular Na+ and Ca2+ simultaneous binding to NCX

// Fractional charge movement:
Const
Qci= 0.1369; // intracellular Ca2+ occlusion reaction of NCX
Qco=0; // extracellular Ca2+ occlusion reaction of NCX
Qn= 0.4315;  // Na+ occlusion reactions of NCX transporter


// ----------------- Ion concentrations, mM -----------------------
const
Cao=2;   // Extracellular Ca2+ concentration
Ko=5.4;  // Extracellular K+ concentration
Mgi=2.5; // Intracellular Mg2+ concentration
Nao=140; // Extracellular Na+ concentration
Ki=140; //  Intracellular K+ concentration
Nai=10; //  Intracellular Na+ concentration
Var
Cai   , //  Myoplasmic Ca2+ concentration
CajSR , //  Ca2+ concentration in the junctional SR
Casub , //  Subspace Ca2+ concentration
CanSR //  Ca2+ concentration in the network SR
:double;

//Equilibrium (reversal) potentials
const
FaradayConst=96485; // C � M^-1
Temperature=310.15; // K
Rconst=8.3144;      // J � M^-1 � K^-1
RTdivF=1000*Rconst* Temperature  / FaradayConst; // RT/F, mV
ECaL=45;  // Apparent reversal potential of ICaL, mV
ECaT=45;  // Apparent reversal potential of ICaT, mV
Est=37.4; // Apparent reversal potential of Ist, mV
var
EK, //   Equilibrium potential for K+, mV
EKs,//   Reversal potential of IKs, mV
ENa //   Equilibrium potential for Na+, mV
:double;

// -------------------Ca2+ diffusion ---------------------------
jCa_dif,    //Ca2+ diffusion flux from subspace to myoplasm, mM/ms
tau_difCa //Time constant of Ca2+ diffusion from the subspace to myoplasm, ms
:double;

// ------------------ SR function -----------------------------
// Ca2+ fluxes  mM/ms
jrel,  //Ca2+ release flux from the junctional SR to subspace
jtr,   //Ca2+ transfer flux from the network to junctional SR
jup,   //Ca2+ uptake flux from the myoplasm to network SR
// Ca2+ pump function
Kup,   //Half-maximal [Ca2+]i for Ca2+ uptake in the network SR, mM
Pup,   //Rate constant for Ca2+ uptake by the Ca2+ pump in the network SR, mM/ms
tau_tr,//Time constant for Ca2+ transfer from the network to junctional SR, ms

// RyR kinetic variables in Shannon 2004 model
R_RyR,O_RyR,I_RyR,RI_RyR,
// parameters of Ca release from junctional SR;
ks,       // 1/ms
koCa,     // mM^-2� ms^-1
kom,      // 1/ms
kiCa,     // mM^-1� ms^-1
kim,      // 1/ms
EC50_SR,  // mM
MaxSR,MinSR,HSR
:double;

// ------------------- Ca2+ and Mg2+ buffering ------------------
const
kbCM=0.542;    // Ca2+ dissociation constant for calmodulin, 1/ms
kbCQ=0.445;    // Ca2+ dissociation constant for calsequestrin, 1/ms
kbTC=0.446;    // Ca2+ dissociation constant for the troponin-Ca site, 1/ms
kbTMC=0.00751; // Ca2+ dissociation constant for the troponin-Mg site, 1/ms
kbTMM=0.751;   // Mg2+ dissociation constant for the troponin-Mg site, 1/ms
kfCM=227.7;    // Ca2+ association constant for calmodulin, mM^-1� ms^-1
kfCQ=0.534;    // Ca2+ association constant for calsequestrin, mM^-1� ms^-1
kfTC=88.8;     // Ca2+ association constant for troponin, mM/ms
kfTMC=227.7;   // Ca2+ association constant for the troponin-Mg site, mM/ms
kfTMM=2.277;   // Mg2+ association constant for the troponin-Mg site, mM/ms
TC_tot=0.031;  // Total concentration of the troponin-Ca site, mM
TMC_tot=0.062; // Total concentration of the troponin-Mg site, mM
CQtot=10;      // Total calsequestrin concentration, mM
CM_tot=0.045;  // Total calmodulin concentration, mM
var
fCMi,  //Fractional occupancy of calmodulin by Ca2+ in myoplasm
fCMs,  //Fractional occupancy of calmodulin by Ca2+ in subspace
fCQ,   //Fractional occupancy of calsequestrin by Ca2+
fTC,   //Fractional occupancy of the troponin-Ca site by Ca2+
fTMC,  //Fractional occupancy of the troponin-Mg site by Ca2+
fTMM:  //Fractional occupancy of the troponin-Mg site by Mg2+
double;
// ----------------- CELL GEOMETRY -------------------------
Lcell,    // Cell length, mkm
Rcell,    // Cell radius, mkm
Lsub,     // Distance between jSR and surface membrane (submembrane space), mkm
Vcell,    // Cell volume, pL
Vi,       // Myoplasmic volume, pL
Vrel,     // Volume of junctional SR (Ca2+ release store), pL
Vsub,     // Submembrane space volume, pL
Vup,      // Volume of network SR (Ca2+ uptake store), pL
Vrel_part,// Part of cell volume occupied by junctional SR
Vup_part, // Part of cell volume occupied by network SR
Vi_part   // Part of cell volume occupied with myoplasm
: double;



// ----------- Simulation variables -----------------------
var
duration,          // total duration of simulation, ms
deltatime:double;  // time step in numerical integration, ms
OutputSampling,    // Output sampling
SamplingCount     // counter to add one sample
:integer;
DataFile:textfile; // file to save simulation data

// Cycle length (CL) estimation from Vm crossings
Vm_prev,         // previous Vm (for threshold crossing detection)
SpikeThreshold,  // spike detection threshold (mV)
lastSpikeTime,   // last spike time (ms)
CLsum            // sum of CLs (ms)
:double;


// analysis
var StartAn_out, EndAn_out: double;
arX, arY: array of double;


var
time_now,
CL_Analysis_start_ms,
OutputSampling_ms,
dT10, //    T  in 10-degree units
HeatDriver: double;
Sensitivity_boo: boolean; // sensitivity analysis
Sens_step: integer;
CLcount:integer; // number of CL intervals accumulated
gCaL_start, gCaL_end, gCaL_delta: double;
gCaL_now: double;
Spike_boo: boolean;



// temperature dependence
var
//all Q10
Q10_gCaL,
Q10_SERCA,
Q10_NCX,
Q10_gh,
Q10_gKr,
Q10_IKr_act,
Q10_IKr_deact,
Q10_IKr_inact,
Q10_IKr_recov
: double;

var
T_Delta, // temperature change over the cycle
jupMin0, // min value of jup in a given cycle
jupMax0,// min value of jup in a given cycle
jupMin0_ini,jupMax0_ini // initial values of min and max of jup
: double;

dT_fixed_boo: boolean; // simulations with fixed temperature
dT_fixed: double; // value of fixed temperature increase
Run_to_find_steady_sate_boo: boolean; // entire run only to find steady-state to use in the next run
dT_dynamic_boo: boolean; //  simulations with oscillating temperature
dT_mean_last_cycle: double; // mean temperature during last cycle (calculated)



// ================ NUMERICAL MODEL PROCEDURES ===============================

// -----------------Sarcolemmal ion currents -----------------
// Finding Gating variables: x = dL, fL, fCa, dT, fT, paF, paS, etc.
procedure FindX(x_inf, tau_x:double; var x:double);
var dxdt:double;
begin
  dxdt:=(x_inf - x)/tau_x;
  x:= x+ dxdt*deltatime;
end;



procedure find_ICaL(V:double); // L-type Ca2+ current
var phiG:double;
begin
  DL_inf:=1/(1+ exp(-(V+13.5)/6));
  FL_inf:=1/(1+exp((V +35)/7.3));
  if V=-35 then V:=-35.00001; // avoiding 0/0
  if V=0 then V:=0.00001;  // avoiding 0/0
    alfa_dL:= -0.02839*(V+ 35)/ (exp(-(V+35)/2.5 )- 1)-0.0849 * V / (exp(-V/4.8)- 1);
  if V=5 then  V:=5.00001; // avoiding 0/0
  beta_dL:= 0.01143 * (V - 5)/ (exp((V- 5)/2.5) -1);
  tau_dL:=1/(alfa_dL+beta_dL);
  tau_fL := 257.1 * exp(-sqr((V+ 32.5)/13.9)) + 44.3; // sqr(x)=x*x
  FindX(dL_inf, tau_dL, dL);
  FindX(fL_inf, tau_fL, fL);
  Fca_inf:=KmfCa / (KmfCa + Casub);
  tau_fCa:= fCa_inf / alfa_fCa;
  FindX(fCa_inf, tau_fCa, fCa_);

  // Temperature dependence (Q10 scaling)
  phiG := Power(Q10_gCaL, dT10);
  ICaL:=Cm*(gCaL*phiG)*(V - EcaL)* dL*fL*fCa_;
end;

procedure find_ICaT(V:double); // T-type Ca2+ current
begin
 DT_inf:=1/ (1 + exp(-(V + 26.3)/6.0));
 FT_inf:= 1/(1+  exp(  (V+ 61.7)/5.6));
 tau_dT:= 1/( 1.068  * exp(  (V+ 26.3)/30   ) + 1.068 * exp(-(V + 26.3)/30 ) );
 tau_fT :=1/( 0.0153 * exp(- (V + 61.7)/83.3) + 0.015 * exp( (V+  61.7)/15.38));
 FindX(dT_inf, tau_dT, dT);
 FindX(fT_inf, tau_fT, fT);
 ICaT:= Cm*gCaT * (V- ECaT)* dT* fT;
end;

procedure find_IKr(V:double); // Rapidly activating delayed rectifier K+ current
var
  phiAct, phiDeact, phiInact, phiRecov, phiG:double;
  tau_paF_T, tau_paS_T, tau_pi_T:double;

begin
  Pa_inf:=1/ (1  +  exp(-(V+23.2)/10.6));
  Pi_inf:= 1/ (1 + exp(   (V + 28.6)/17.1));
  tau_paF:= 0.84655354/(0.0372 * exp((V)/15.9) +
    0.00096 * exp(-(V)/22.5));
  tau_paS:= 0.84655354/(0.0042 * exp((V)/17.0) +
    0.00015  * exp(-(V)/21.6));
  tau_pi:= 1/(0.1 * exp(-V/54.645) + 0.656 * exp(V/106.157));

// Temperature dependence (Q10 scaling)

  phiAct   := Power(Q10_IKr_act,   dT10);
  phiDeact := Power(Q10_IKr_deact, dT10);
  phiInact := Power(Q10_IKr_inact, dT10);
  phiRecov := Power(Q10_IKr_recov, dT10);
  phiG := Power(Q10_gKr, dT10);


  // Direction-dependent scaling (approximate separate Q10 for opening vs closing, etc.)
  if Pa_inf > paF then tau_paF_T := tau_paF/phiAct else tau_paF_T := tau_paF/phiDeact;
  if Pa_inf > paS then tau_paS_T := tau_paS/phiAct else tau_paS_T := tau_paS/phiDeact;

  // For pi_: Pi_inf < pi_ corresponds to inactivation (pi_ decays); Pi_inf > pi_ corresponds to recovery
  if Pi_inf < pi_ then tau_pi_T := tau_pi/phiInact else tau_pi_T := tau_pi/phiRecov;

  FindX(pa_inf, tau_paF_T, paF);
  FindX(pa_inf, tau_paS_T, paS);
  FindX(pi_inf, tau_pi_T, pi_);

  IKr:=Cm*(gKr*phiG)*(V - EK)*(0.6* paF + 0.4 * paS)*  pi_;
end;

procedure find_IKs(V:double); // Slowly activating delayed rectifier K+ current
begin
  alfa_n:= 0.014/ (1 + exp(-(V- 40)/9));
  beta_n:= 0.001 * exp(-V/45);
  n_inf:= alfa_n/(alfa_n +beta_n);
  tau_n:=1/(alfa_n+beta_n);
  FindX(n_inf, tau_n, n);
  IKs:= Cm*gKs*(V - Eks)*sqr(n); // sqr(n)=n*n
end;

procedure find_ItoIsus(V:double); // 4-AP-sensitive currents
begin
  q_inf:=1/(1 + exp((V+ 49)/13));
  r_inf:=1/(1 + exp(-(V - 19.3)/15));
 tau_q:= 39.102/(0.57*exp(-0.08*(V+44))+0.065*exp(0.1*(V+45.93)))+ 6.06;
 tau_r:=14.40516/(1.037*exp(0.09*(V+30.61))+0.369*exp(-0.12*(V+23.84)))+2.75352;
  FindX(q_inf, tau_q, q);
  FindX(r_inf, tau_r, r);
  Ito:= Cm*gto*(V- EK)* q* r;
  Isus:= Cm*gsus * (V - EK)* r;
  ItoIsus:=Ito+Isus;
end;

procedure find_If(V:double); // Hyperpolarization-activated current
var phiG:double;
begin
  y_inf:= 1/(1 + exp((V-V_Ih12)/13.5));
  tau_y:= 0.7166529/(exp(-(V+ 386.9)/45.302) + exp((V - 73.08)/19.231));
  FindX(y_inf, tau_y, y);
    // Temperature dependence (Q10 scaling)
  phiG := Power(Q10_gh, dT10);
  IhNa:=Cm*0.3833 * (gh * phiG) *(V - ENa)*sqr(y) ; // sqr(y)=y*y
  IhK:= Cm*0.6167 * (gh * phiG) *(V -  EK)*sqr(y);
  I_f:=IhNa+ IhK;

end;

procedure find_Ist(V:double); // Sustained inward current
begin
  qa_inf:=1/(1 + exp(-(V + 57)/5));
  alfa_qa:=1/(0.15 * exp(-V/11) + 0.2 * exp(-V/700));
  beta_qa :=1/(16 * exp(V/8) + 15 * exp(V/50));
  tau_qa:=1/(alfa_qa + beta_qa);
  alfa_qi :=1/ (3100 * exp(V/13) + 700 *exp(V/70)) ;
  beta_qi:=1/(95* exp(-V/10) + 50 *exp(-V/700)) + 0.000229/(1 + exp(-V/5));
  tau_qi:=6.65/(alfa_qi +beta_qi);
  qi_inf:=alfa_qi/ (alfa_qi + beta_qi);
  FindX(qa_inf, tau_qa, qa);
  FindX(qi_inf, tau_qi, qi);
  Ist :=Cm*gst* (V - Est)* qa* qi;
end;

procedure find_IbNa(V:double); // Na+ background current
begin
  IbNa:=Cm*gbNa*(V - ENa);
end;

procedure find_INaK(V:double); //  Na+/K+ pump current
begin
  INaK:= Cm*InaKmax /((1 + power(KmKp/Ko,1.2))*
  (1+ power(KmNap/Nai,1.3))*(1+ exp(-(V- ENa+ 120)/30)));
end;

Procedure find_IbCa(V:double); // Ca2+ background current
begin
  IbCa:= Cm*gbCa*(V - ECaL);
end;

procedure find_INCX(V:double); //  NCX current
var
  di, do_,k43,k12, k14, k41, k34, k21, k23, k32, x1, x2, x3, x4: double;
  phiNCX:double;
begin
  do_:=1+(Cao/Kco)*(1+exp(Qco * V/RTdivF))+(Nao/K1no)*
    (1+(Nao/K2no)*(1+Nao/K3no));
  k43:=Nai/(K3ni +Nai);
  k41 := exp(-Qn * V /(2*RTdivF));
  k34 :=Nao/(K3no+Nao);
  k21:=(Cao/Kco)*exp(Qco * V/RTdivF) /do_;
  k23 := (Nao/K1no)*(Nao/K2no)*(1+Nao/K3no)* exp(-Qn* V/(2*RTdivF))/do_;
  k32:=exp(Qn * V/(2*RTdivF));
  x1:= k34 * k41 *(k23 + k21) + k21 * k32 *(k43 + k41);
  di:=1+(Casub/Kci)*(1 + exp(-Qci * V /RTdivF)+Nai/Kcni)+
    (Nai/K1ni)*(1 +(Nai/K2ni)*(1 +Nai/K3ni));
  k12:=(Casub/Kci)* exp(-Qci* V/RTdivF)/di;
  k14:=(Nai/K1ni)*(Nai/K2ni)*
    (1 +Nai/K3ni)* exp(Qn * V /(2*RTdivF))/di;
  x2:= k43* k32  *(k14 + k12) + k41* k12 *(k34 + k32);
  x3:= k43 * k14 *(k23 + k21) + k12 * k23*(k43 + k41);
  x4:= k34 * k23 *(k14 + k12) + k21 * k14* (k34+ k32);
  // Temperature dependence (Q10 scaling)
  phiNCX:=  Power(Q10_NCX, dT10);
  INCX:= Cm*(kNCX*phiNCX)*(k21 * x2 - k12 * x1) / (x1 + x2 + x3 + x4);
end;


procedure Update_Currents(V:double);
begin
// Finding all currents
  find_ICaL(V); find_ICaT(V); find_IKr(V); find_IKs(V); find_ItoIsus(V);
  find_If(V); find_Ist(V); find_IbNa(V); find_INaK(V);
  find_INCX(V); find_IbCa(V);
end;// proc

// --------------- ION DYNAMICS -------------------------
function SR_Ca_release_via_RyRs:double;
var
  dRdt, dOdt, dIdt, dRIdt, kCaSR, koSRCa, kiSRCa, Casub_2:double;
  phiRyR: double;
begin
// Shannon's type of Ca release; Bioph.J.2004:87:3351-3371
  Casub_2:=sqr(Casub); // sqr(Casub)= Casub*Casub
  kCaSR:=MaxSR-(MaxSR-MinSR)/ (1+power((EC50_SR/CajSR),HSR));
  koSRCa:=koCa/kCaSR;
  kiSRCa:=kiCa*kCaSR;
  dRdt:=(kim*RI_RyR-kiSRCa*Casub*R_RyR)-(koSRCa*Casub_2*R_RyR - kom*O_RyR);
  dOdt:=(koSRCa*Casub_2*R_RyR-kom*O_RyR) - (kiSRCa* Casub *O_RyR - kim*I_RyR);
  dIdt:= (kiSRCa* Casub*O_RyR-kim*I_RyR)-(kom*I_RyR - koSRCa*Casub_2*RI_RyR);
  dRIdt:=(kom*I_RyR - koSRCa* Casub_2*RI_RyR)-(kim*RI_RyR - kiSRCa*Casub*R_RyR);
  R_RyR:=R_RyR+ dRdt*deltatime;
  O_RyR:=O_RyR+ dOdt*deltatime;
  I_RyR:=I_RyR+ dIdt*deltatime;
  RI_RyR:=RI_RyR+ dRIdt*deltatime;
  // No temperature dependence for RyR activatioon
 SR_Ca_release_via_RyRs:=ks*O_RyR*(CajSR-Casub);
end;

procedure Update_Ion_Concentrations;
var
  dCaidt,dfCMidt,dfTCdt,dfTMCdt,dCasubdt,
  dfCMsdt,dCajSRdt,dfCQdt,dCanSRdt,dfTMMdt:double;
  PhiSERCA: double;
begin
//----------- Calcium fluxes ------------------
  jCa_dif:=(Casub - Cai)/tau_difCa;

  // Temperature dependence (Q10 scaling)
  PhiSERCA:=  Power(Q10_SERCA, dT10);
  jup:= (Pup*PhiSERCA)/(1 + Kup/Cai); // ***

  HeatDriver:= 1 - (jup - jupMin0)/(jupMax0- jupMin0);

  jtr:=(CanSR - CajSR)/tau_tr;
  jrel:=SR_Ca_release_via_RyRs;


// ---------------- Ca2+ buffering --------------------------
  DfTCdt:= kfTC*Cai*(1 -fTC) - kbTC* fTC;
  dfTMCdt:=  kfTMC *Cai*(1- fTMC - fTMM) - kbTMC * fTMC;
  dfTMMdt:= kfTMM *Mgi*(1-fTMC -  fTMM)- KbTMM * fTMM;
  dfCMidt:=   kfCM *Cai*(1- fCMi) -  kbCM * fCMi;
  dfCMsdt:=  kfCM *Casub*(1 - fCMs) - kbCM * fCMs;
  dfCQdt:=   kfCQ *CajSR*(1- fCQ) -  kbCQ * fCQ;
  fTC:=fTC+DfTCdt*deltatime;
  fTMC:=fTMC+dfTMCdt*deltatime;
  fTMM:=fTMM+dfTMMdt*deltatime;
  fCMi:=fCMi+dfCMidt*deltatime;
  fCMs:=fCMs+dfCMsdt*deltatime;
  fCQ:=fCQ+dfCQdt*deltatime;
//------------- Ca2+ dynamics --------------------------------
  dCaidt:=(jCa_dif * Vsub - jup * Vup) /Vi -
    (CM_tot *dfCMidt + TC_tot *dfTCdt + TMC_tot*dfTMCdt);
  Cai:=Cai+ dCaidt*deltatime;
  dCasubdt:= jrel*Vrel/Vsub -(ICaL+ICaT+IbCa-2*INCX)/(2*FaradayConst*Vsub)-
    (jCa_dif + CM_tot *dfCMsdt);
  Casub:=Casub + dCasubdt*deltatime;
  dCajSRdt:= jtr - jrel - CQtot * dfCQdt;
  CajSR:=CajSR+ dCajSRdt*deltatime;
  dCanSRdt:= jup - jtr *Vrel/Vup;
  CanSR:=CanSR+dCanSRdt* deltatime;
end;


//----------- Setting model parameters  ------------------------
procedure Set_Model_Parameters;
begin

HeatDriver:=0;

EK:=  RTdivF * ln(Ko/Ki);   //   Equilibrium potential for K+, mV
EKs:= RTdivF * ln((Ko + 0.12* Nao)/(Ki + 0.12 * Nai)); //   Reversal potential of IKs, mV
ENa:= RTdivF * ln(Nao/Nai); //   Equilibrium potential for Na+, mV

// sarcolemmal ionic currents nS/pF
    gCaL:= 0.464;
    gbNa:=0.00486;
    gh:=0.15;
    gCaT:=0.1832;
    gst:=0.003;
    gKs:=0.0259;
    gto:=0.252;
    gsus:=0.02;
    INaKmax:= 2.88;
    kNCX:=187.5;
    gbCa:=0.0006;
    gKr:= 0.08113973; //  i.e. 0.03* power(Ko,0.59); // nS/pF

// I_f half activation voltage
    V_Ih12:=-64; // mV

  //SR Ca2+ handling:
    Pup:=	0.012	;// mM/ms //!!!   ~~~
    tau_difCa:=	0.04 ;	// ms
    tau_tr:=	40 ;	// ms
    Kup	:= 0.6 /1000 ;// 	mM
    ks := 250000; // 1/ms that is 250 1/mks
    koCa:=10; // mM^-2� ms^-1
    kiCa:=0.5; // mM^-1� ms^-1
    EC50_SR:= 0.45;   // mM
    kom	:=0.06; // 1/ms
    kim	:=0.005; // 1/ms
    MaxSR:=15;
    MinSR:=1;
    HSR	:=2.5;

// cell cylinder dimentions, mkm
    Lsub := 0.02;
    Rcell	:= 4;
    Lcell	:= 70;

// relative sizes of cell Ca2+ compartments (compared to total cell volume)
    Vi_part:=	0.46 ;
    Vup_part:=	0.0116 ;
    Vrel_part	:=0.0012 ;

// volumes of cell Ca2+ compartments, picoliters (pL);
// 1 pL = 1000 mkm^3, therefore, the coefficient below = 0.001
  Vcell:=0.001*pi*Rcell*Rcell*Lcell;
  Vsub:=0.001*2*pi*lsub*(Rcell-lsub/2)*Lcell;
  Vi:=Vi_part*Vcell-Vsub;
  Vrel:=Vrel_part*Vcell;
  Vup:=Vup_part*Vcell;

end; // proc



// The procedure below is used to set initial values to
// Table in our 2009 original model paper in Table 1 published in AJP
// https://pmc.ncbi.nlm.nih.gov/articles/PMC2660239/
// Maltsev VA, Lakatta EG.
// Synergism of coupled subsarcolemmal Ca2+ clocks and sarcolemmal voltage
// clocks confers robust and flexible pacemaker function in a novel pacemaker
// cell model. Am J Physiol Heart Circ Physiol. 2009 Mar;296(3):H594-615.
//doi: 10.1152/ajpheart.01118.2008. Epub 2009 Jan 9.
// PMID: 19136600; PMCID: PMC2660239.

procedure Set_Initial_Values_Table1_in_2009JGP;
begin
// Kurata model SR function
Cai:=	0.0001 ;//	y1
Casub:=	0.000223;//	y2
CajSR:=	0.029;//	y3
CanSR:=	1.35;//	y4
ftc:=	0.02;//	y5
ftmc:=	0.22;//	y6
ftmm:=	0.69;//	y7
fcmi:=	0.042;//	y8
fcms:=	0.089;//	y9
fcq:=	0.032;//	y10
// Shannon model RyR function
R_RyR:=	0.7499955;//	y11
O_RyR:=	3.4E-6;//	y12
I_RyR:=	1.1E-6;//	y13
RI_RyR:=	0.25;//	y14
// Kurata model ion currents
Vm:=	-65;//	y15
dL:=	0;//	y16
fL:=	1;//	y17
fCa_:=	1;//	y18
paF:=	0;//	y19
paS:=	0;//	y20
pi_:=	1;//	y21
n:=	0;//	y22
y:=	1;//	y23
dT:=	0;//	y24
fT:=	1;//	y25
q:=	1;//	y26
r:=	0;//	y27
qa:=	0;//	y28
qi:=	1;//	y29
end;



Procedure GeneratePlots;
       begin
        inc(SamplingCount);
        if SamplingCount=OutputSampling then  // output
          begin
            SamplingCount:=0; // zeroing sampling counter
              FLS[1].AddXY(time_now,Vm);   // Vm
              FLS[2].AddXY(time_now,1000*jup); // Jup in mM/s, in ML model it is mM/ms
              FLS[3].AddXY(time_now, T_Delta*HeatDriver); // dynamic temperature change
              FLS[4].AddXY(time_now, ICaL);
              FLS[5].AddXY(time_now, INCX);
              FLS[6].AddXY(time_now, I_f);
              FLS[7].AddXY(time_now, IKr);
              FLS[8].AddXY(time_now, Casub);
         end;   // sampling trigger
       end; // if fplot



////////////////////////////////////////////
procedure Set_Simulation_Parameters;
var i:integer;
s, s1: string;
x: double;
Q10: double;
begin

// model integration and output
  deltatime:=0.01 ; //  ms, model integration time tick
  duration:=15000; ; //  ms   simulation duration  (default)
  OutputSampling_ms:=1; // ms (default)
  SamplingCount:=0;  // sampling counter

// CL analysis timing
CL_Analysis_start_ms:= 10000;

// temperature settings
T_Delta := 0.7; // deafult temperature change over the cycle

// max and min seed values obtained from original Maltsev-Lakatta model at a steady-state
jupMin0 := 0.0023495;
jupMax0 := 0.0051748;


with Form1 do
    begin
       // read customized parameters from memo2
        for I := 0 to Memo2.Lines.Count -1 do
        begin
         s:= Memo2.Lines[i];
         if s<>'' then
         if s[1]<>'/' then
         begin
         s1:= CharStr('=', s, 2);
         s1:= trim(s1);
          if TryStrToFloat(s1, x) then
           begin

             if ContainsText(s,'Duration_ms') then duration:= x else
             if ContainsText(s,'CL_Analysis_start_ms') then CL_Analysis_start_ms:= x else
             if ContainsText(s,'OutputSampling_ms') then OutputSampling_ms:= x else

             if ContainsText(s,'T_Delta') then T_Delta:= x else
             if ContainsText(s,'jupMin0') then jupMin0:= x else
             if ContainsText(s,'jupMax0') then jupMax0:= x else
           end;
         end;
        end;

       jupMin0_ini:= jupMin0;
       jupMax0_ini:= jupMax0;


  OutputSampling:= round(OutputSampling_ms/deltatime); // sampling ratio

      // default = fixed temperature, i.e. all Q10 = 1
          Q10_gCaL:= 1;
          Q10_SERCA:= 1;
          Q10_NCX:= 1;
          Q10_gh:= 1;
          Q10_gKr:=  1;
          Q10_IKr_act:= 1;
          Q10_IKr_deact:= 1;
          Q10_IKr_inact:=  1;
          Q10_IKr_recov:= 1;

      // setting a custom list of temperature-sensitive components
          for i:=0 to checklistbox1.Items.Count -1 do
          if checklistbox1.Checked[i] then
          begin
           Q10:=  StrToFloat(Memo1.Lines[i]);
               case i of
                0: Q10_gCaL:=Q10;
                1: Q10_SERCA:= Q10;
                2: Q10_NCX:= Q10;
                3: Q10_gh:= Q10;
                4: Q10_gKr:= Q10;
                5: Q10_IKr_act:= Q10;
                6: Q10_IKr_deact:=  Q10;
                7: Q10_IKr_inact:= Q10;
                8: Q10_IKr_recov:= Q10;
             End;
          end;

    // custom Pup, Rate constant for Ca2+ uptake by the Ca2+ pump in the network SR
         if CheckBox12.Checked then
         begin
      //     Pup:=	0.012	;// mM/ms in ML model 2009
          Pup:= StrToFloat(Edit15.Text)/1000;
         end;

      // custom gCaL, Maximum ICaL conductance?
         if CheckBox2.Checked then
         begin
      //     gCaL:=	0.464	;// nS/pF in ML model 2009
          gCaL:= StrToFloat(Edit2.Text);
         end;
    end; // with Form1

end; // proc



procedure PerformSimulation;
var i,j:integer;         // for-loop index
CL1: double;   // catch cycle length value
jup_min, jup_max: double; // catch max min jup

   jminAr, jmaxAr, CrossAr, CLdataAr: array of double; // data arrays
   dT10_SUM, x,y, Hz1, Mean1, SD1, SEM1: double; // results

   s, dT_mean_last_cycle_STR,
   jupMin0_STR, jupMax0_STR,
   Mean1_STR, Hz1_STR, SD1_STR, SEM1_STR: string; // output strings

   cycle_ticks_count: integer;  // counter of ticks in each AP cycle


// output
var
Fname: string;
FolderName:string;

//================= SIMULATIONS=====================
begin
with Form1 do
begin
   Set_Model_Parameters;
   Set_Initial_Values_Table1_in_2009JGP;
   Set_Simulation_Parameters;
   Spike_boo:=false;


// initite plots
   Chartclean;
   Fplot.Series2.clear;
   FPLot.Series3.Clear;
   FPLot.Series4.Clear;

if checkbox1.Checked then
 begin
   AddNewName('Vm');
   AddNewName('jup');
   AddNewName('DeltaT');

   AddNewName('ICaL');
   AddNewName('INCX');
   AddNewName('I_f');
   AddNewName('IKr');
   AddNewName('Casub');
 end;


// initialize cycle length (CL) estimation
   Vm_prev := Vm;
   SpikeThreshold := 0;   // mV (upward crossing)
   lastSpikeTime := -1;   // ms (unset)
   CLsum := 0;
   CLcount := 0;

// initialize jup max and min search
// each cycle  jup max and min will be found and set for heat driver for the next cycle
   jup_min:= jupMin0;
   jup_max:= jupMax0;

// clean CL data array
   CrossAr:= nil;
   CLdataAr:=nil;
   jminAr:=nil;
   jmaxAr:=nil;

// clean output window
   memo4.Clear;
   memo4.lines.Add('perfomimg simulations');

// sensitivity analysis
   if Sensitivity_boo then
     begin
     gCaL:= gCaL_now;
      memo4.lines.Add('Step # ' + IntToStr(Sens_step));
      memo4.lines.Add('gCaL = ' + FloatToStrF(gCaL, ffgeneral, 8,8));
     end;

     dT_mean_last_cycle:=0;
     dT10_SUM:=0;
     cycle_ticks_count:=0;

// wait until everything ready
   Application.ProcessMessages;


///////////////// MODEL INTEGRATION LOOP START /////////////////////////////////
   for i:=1 to round(duration/deltatime) do
    BEGIN
      Update_Ion_Concentrations;

   // set temperature each integration step
      if dT_fixed_boo then dT10:= dT_fixed/10
      else
      dT10:= T_Delta*HeatDriver/10; // /10 becuase Q10 is for 1 decade, 10 degrees

       dT10_SUM:= dT10_SUM + dT10;
       inc(cycle_ticks_count);

    // find all currents
      Update_Currents(Vm);

   // find total current and update Vm
      Im:=ICaL+ICaT+IKr+IKs+ItoIsus+I_f+Ist+IbNa+INaK+INCX+IbCa;
      dVdt:= -Im/Cm;
      Vm := Vm + dVdt * deltatime;

      time_now:= i*deltatime;

    // Check jup range each integration step
           if jup < jup_min then jup_min := jup;
           if jup > jup_max then jup_max := jup;

    // Cycle length detection from Vm upward threshold crossings
      if (Vm_prev < SpikeThreshold) and (Vm >= SpikeThreshold) then
        begin
          if lastSpikeTime >= 0 then
           If time_now> CL_Analysis_start_ms then  // collect data after steady-state is reached
            begin
              CL1:= time_now - lastSpikeTime;
              CLsum := CLsum + CL1;
              inc(CLcount);
              Spike_boo:=true;  // flag for output cyle parameters

              SetLength(CLdataAr, CLcount);
              SetLength(CrossAr, CLcount);

              SetLength(jminAr, CLcount);
              SetLength(jmaxAr, CLcount);

              CLdataAr[CLcount-1] := CL1;
              CrossAr[CLcount-1] := time_now;

              jminAr[CLcount-1] := jup_min;
              jmaxAr[CLcount-1] := jup_max;


                dT_mean_last_cycle:=  10*dT10_SUM/cycle_ticks_count;
                cycle_ticks_count:=0;
                dT10_SUM:=0;
            end;
          lastSpikeTime := time_now;

        // ajust heat index each cycle
         jupMin0:= jup_min;
         jupMax0:= jup_max;

        // initialize search for max and min of jup in the upcoming AP cycle
          jup_min := MaxDouble;
          jup_max := -MaxDouble;
        end;

   // remember Vm
      Vm_prev := Vm;

     if checkbox1.Checked then GeneratePlots; // generate plots dueing simulations

   END;  // end of simulations

/////////////////  MODEL INTEGRATION LOOP END //////////////////////////////////

  if dT_fixed_boo then dT_mean_last_cycle:= dT_fixed;


  // calculate statistics
  if CLcount>0 then   // if AP firing
     begin
      Mean1:= Mean(CLdataAr); Mean1_STR:=FloatToStrF(Mean1, FFgeneral, 8, 8);
      Hz1:= 1000/Mean1;  Hz1_STR:=FloatToStrF(Hz1, FFgeneral, 8, 8);
      if CLcount>1 then
        begin
         SD1:=  StdDev(CLdataAr); SD1_STR:=FloatToStrF(SD1, FFgeneral, 8, 8);
         SEM1:= SD1/Sqrt(CLcount); SEM1_STR:=FloatToStrF(SEM1, FFgeneral, 8, 8);
         dT_mean_last_cycle_STR:=FloatToStrF(dT_mean_last_cycle, FFgeneral, 8, 8);
         jupMin0_STR:=   FloatToStrF(jupMin0, ffgeneral, 8,8);
         jupMax0_STR:=   FloatToStrF(jupMax0, ffgeneral, 8,8);
        end
        else
        begin   // SD is not defined for n=1
          SD1_STR:='ND';
          SEM1_STR:='ND';
        end;
     end
     else
     begin      // no AP firing
      Mean1_STR:='ND';
      Hz1_STR:='0';
      jupMin0_STR:='ND';
      jupMax0_STR:='ND';
      dT_mean_last_cycle_STR:='ND'; // if no AP single cyle, it is not defined
     end;


//append short report (append is important for sensetivity analyses)
// gCaL, Hz, Mean, jupMin, jupMax
if not Run_to_find_steady_sate_boo then  // skip report if this simulation run is just to find steady-state
begin
 memo3.Lines.Add(
     FloatToStrF(gCaL, ffgeneral, 8,8) + #9+
     Hz1_STR  + #9+
     Mean1_STR + #9+
    jupMin0_STR + #9+
    jupMax0_STR + #9+
    dT_mean_last_cycle_STR);
end;


// write statistics and each cycle parameters to memo and show where Vm crossing AP threshold
  if CLcount>0 then
  begin
     Memo4.Clear;
  // write statistics
      Memo4.Lines.Add('N='+ #9+IntToStr(CLcount));
      Memo4.Lines.Add('Mean='+ #9+ Mean1_STR);
      Memo4.Lines.Add('SEM='+  #9+ SEM1_STR);
      Memo4.Lines.Add('SD='+  #9+ SD1_STR);

  // write each detected cycle to memo4 and plot points of crossing AP detection threshold
    if checkbox3.Checked then
    begin
      Memo4.Lines.Add('CL in each cycle:');
      Fplot.Series2.Pointer.Color:=ClLime; //ClGreen;
      Fplot.Series2.Pointer.Size:=3;

      for i:=0 to CLcount-1 do
      begin
        x:=  CrossAr[i];
        /// Plot data point of AP detection (Vm crosses threshold)
        Fplot.Series2.AddXY(x, SpikeThreshold);

        // write each CL value to memo
        Cl1:= CLdataAr[i];
        s:= IntToStr(i+1);
        s:=s+#9+
        FloatToStrF(x, FFgeneral, 8, 8)+ #9+
        FloatToStrF(CL1, FFgeneral, 8, 8);
        Memo4.Lines.Add(s);
      end;
     end; // if check box

   // plot jmin
    j:=0;
    AddNewName('jmin');
    if CL_Analysis_start_ms = 0 then Add1XYToPlot(0,1000*jupMin0_ini);
    for i:=0 to FLS[1].Count-1 do
    begin
      x:= FLS[1].XValue[i];
      if x >=  CL_Analysis_start_ms then
        begin
          if x> CrossAr[j] then
          if j+1 <=CLcount-1
          then  inc(j);
          Add1XYToPlot(x,1000*jminAr[j]);
        end;
    end;


   // plot jmax
    j:=0;
    AddNewName('jmax');
    if CL_Analysis_start_ms = 0 then Add1XYToPlot(0,1000*jupMax0_ini);
    for i:=0 to FLS[1].Count-1 do
    begin
      x:= FLS[1].XValue[i];
      if x >=  CL_Analysis_start_ms then
        begin
         if x> CrossAr[j] then
         if j+1 <=CLcount-1
         then  inc(j);
         Add1XYToPlot(x,1000*jmaxAr[j]);
        end;
    end;


  end // if CLcount>0, end of detailed report
  else
  begin // no firing
         Memo4.Clear;
         Memo4.Lines.Add('No AP firing');
  end;



// clean temp data arrays
   CrossAr:= nil;
   CLdataAr:=nil;
   jminAr:=nil;
   jmaxAr:=nil;

end; // with Form
end;// proc



///////////////////////////////

procedure TForm1.Button1Click(Sender: TObject);   // DO simulations
begin
      dT_fixed_boo:=false;
      Run_to_find_steady_sate_boo:=false;
      dT_dynamic_boo:=false;


     Case RadioGroup1.ItemIndex of
       0: dT_dynamic_boo:=true;    // run with dynamic jup and jmin
       1: Run_to_find_steady_sate_boo:=true; // run to find steady-state
       2: dT_fixed_boo:=true; // run with dixed dT above the temperature in the original 2009 ML model
     End;

       dT_fixed:= StrToFloat(edit1.Text);

// do first simulation
  PerformSimulation;

  if not Run_to_find_steady_sate_boo then exit;

  if CLcount = 0 // of no AP firing exit here
  then
  begin
   memo3.Lines.Add(
     FloatToStrF(gCaL, ffgeneral, 8,8) + #9+
    '0'  + #9+
    'ND' + #9+
    'ND' + #9+
    'ND' + #9+
    'ND');
    exit;
  end;


 // repeat simulations with dT set to steady-state with same parameters and settings
  Run_to_find_steady_sate_boo:=false;
  dT_fixed_boo:=true;
  dT_fixed:= dT_mean_last_cycle;

// do second simulation with dT set to steady state
  PerformSimulation;

end;


////////////////////////////////////


procedure TForm1.Button2Click(Sender: TObject);
begin
  fPLot.Visible:= true;
  fPLot.BringToFront;
end;





procedure TForm1.Button3Click(Sender: TObject);    // sensitivity analysis with gCaL varying
begin
memo3.Clear;
Sensitivity_boo:= true;
gCaL_start:= StrToFloat(edit12.Text);
gCaL_end:=   StrToFloat(edit13.Text);
gCaL_delta:=StrToFloat(edit14.Text);

 gCaL_now:=gCaL_start - gCaL_delta;
 Sens_step:=0;
repeat
 inc(Sens_step);
 gCaL_now:=gCaL_now + gCaL_delta;
 Button1.Click;
until gCaL_now>=  gCaL_end;

Sensitivity_boo:= false;
end;// proc



procedure TForm1.Button4Click(Sender: TObject);
begin
 Memo3.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject); // simulate in sequence
var i, i_loop: integer;
begin
// clear sequence
  for i:=0 to checklistbox1.Items.Count -1 do  checklistbox1.Checked[i] := false;
   Application.ProcessMessages;
// loop
     for i_loop:=0 to checklistbox1.Items.Count -1 do
     begin
      checklistbox1.Checked[i_loop]:= true;
      PerformSimulation;
      Application.ProcessMessages;
     end;
end; // proc



procedure TForm1.Button6Click(Sender: TObject); // simulate in separation
var i, i_loop: integer;
begin
// loop
     for i_loop:=0 to checklistbox1.Items.Count -1 do
     begin
      // clear sequence
       for i:=0 to checklistbox1.Items.Count -1 do  checklistbox1.Checked[i] := false;
       Application.ProcessMessages;
      checklistbox1.Checked[i_loop]:= true;
      PerformSimulation;
//      Button1.Click;
      Application.ProcessMessages;
     end;
end;  // proc



procedure TForm1.Button7Click(Sender: TObject);
var i: integer;
begin
// check all
   for i:=0 to checklistbox1.Items.Count -1 do  checklistbox1.Checked[i] := true;
end;



procedure TForm1.Button8Click(Sender: TObject);
var i: integer;
begin
// uncheck all
   for i:=0 to checklistbox1.Items.Count -1 do  checklistbox1.Checked[i] := false;
end;


procedure TForm1.Button9Click(Sender: TObject);
begin
Clipboard.AsText := Memo3.Text;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
Sensitivity_boo:= false;
end;

/////////////////////



end.
