function varargout = calculSono(varargin)
% CALCULSONO M-file for calculSono.fig
%      CALCULSONO, by itself, creates a new CALCULSONO or raises the existing
%      singleton*.
%
%      H = CALCULSONO returns the handle to a new CALCULSONO or the handle to
%      the existing singleton*.
%
%      CALCULSONO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULSONO.M with the given input arguments.
%
%      CALCULSONO('Property','Value',...) creates a new CALCULSONO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculSono_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculSono_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calculSono

% Last Modified by GUIDE v2.5 09-Mar-2020 17:02:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculSono_OpeningFcn, ...
                   'gui_OutputFcn',  @calculSono_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before calculSono is made visible.
%--------------------------------------------------------------------------
function calculSono_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculSono (see VARARGIN)

% Initialization
addpath('Scripts/')
handles.filepath = '';
handles.wavfile = '';
handles.FSax = 12;
set(handles.txtMesure,'String','Enter your .WAV file here')
set(handles.txtTimeStart,'enable','off')
set(handles.txtTimeEnd,'enable','off')
set(handles.checkSignal,'enable','off')
set(handles.checkLZI,'enable','off')
set(handles.checkLZF,'enable','off')
set(handles.checkLZS,'enable','off')
set(handles.checkContinu,'enable','off')
set(handles.checkPondZ,'enable','off')
set(handles.checkPondA,'enable','off')
set(handles.checkPondC,'enable','off')

semilogx(handles.graphSp,0,0)
set(handles.graphP,'XGrid','on','YGrid','on','fontsize',handles.FSax)
set(handles.graphLp,'XGrid','on','YGrid','on','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)
ylabel(handles.graphP,'Acoustic pressure [Pa]','fontsize',handles.FSax)
xlabel(handles.graphLp,'Time [s]','fontsize',handles.FSax)
ylabel(handles.graphLp,'[dB SPL]','fontsize',handles.FSax)
xlabel(handles.graphSp,'Frequency [Hz]','fontsize',handles.FSax)
ylabel(handles.graphSp,'[dB SPL]','fontsize',handles.FSax)

% Choose default command line output for calculSono
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calculSono wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
%--------------------------------------------------------------------------
function varargout = calculSono_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtMesure_Callback(hObject, eventdata, handles)
% hObject    handle to txtMesure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of txtMesure as text
%        str2double(get(hObject,'String')) returns contents of txtMesure as a double


% --- Executes during object creation, after setting all properties.
function txtMesure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMesure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTimeStart_Callback(hObject, eventdata, handles)
% hObject    handle to txtTimeStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of txtTimeStart as text
%        str2double(get(hObject,'String')) returns contents of txtTimeStart as a double


% --- Executes during object creation, after setting all properties.
function txtTimeStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTimeStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTimeEnd_Callback(hObject, eventdata, handles)
% hObject    handle to txtTimeEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of txtTimeEnd as text
%        str2double(get(hObject,'String')) returns contents of txtTimeEnd as a double


% --- Executes during object creation, after setting all properties.
function txtTimeEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTimeEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtPref_Callback(hObject, eventdata, handles)
% hObject    handle to txtPref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of txtPref as text
%        str2double(get(hObject,'String')) returns contents of txtPref as a double


% --- Executes during object creation, after setting all properties.
function txtPref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end










% --- Executes on button press in btnBrowse.
%--------------------------------------------------------------------------
function btnBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath] = uigetfile({'*.wav','Audio file (*.wav)'},'Select a file',handles.filepath);
if ~isequal(filename,0)
    wavfile = [filepath filename];
    handles.filepath = filepath;
    set(handles.txtMesure,'String',wavfile)
    handles.wavfile = wavfile;
end

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in checkManual.
%--------------------------------------------------------------------------
function checkManual_Callback(hObject, eventdata, handles)
% hObject    handle to checkManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
isManual = get(hObject,'Value');
if isManual
    set(handles.txtTimeStart,'enable','on')
    set(handles.txtTimeEnd,'enable','on')
else
    set(handles.txtTimeStart,'enable','off')
    set(handles.txtTimeEnd,'enable','off')
end

% Update handles structure
guidata(hObject, handles);




% --- Executes on button press in btnGo.
%--------------------------------------------------------------------------
function btnGo_Callback(hObject, eventdata, handles)
% hObject    handle to btnGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.checkSignal,'enable','on')
set(handles.checkLZI,'enable','on')
set(handles.checkLZF,'enable','on')
set(handles.checkLZS,'enable','on')
set(handles.checkContinu,'enable','on')
set(handles.checkPondZ,'enable','on')
set(handles.checkPondA,'enable','on')
set(handles.checkPondC,'enable','on')

% File name
wavfile = get(handles.txtMesure,'String');
% Importation du fichier wave
try
    [p, Fs] = audioread(wavfile);
    
    p = p(:,1)'; % keep the first channel of the file in case of a stereo file
    % Number of samples
    N = length(p);
    
    % Start and end times [s]
    isManual = get(handles.checkManual,'Value');
    if isManual
        t0 = str2double(get(handles.txtTimeStart,'String'));
        tf = str2double(get(handles.txtTimeEnd,'String'));
        p = p((t0*Fs+1):(tf*Fs));
    else
        t0 = 0;
        tf = t0 + N/Fs; % normalement on aurait tf = t0 + (N-1)/Fs
        set(handles.txtTimeStart,'String',t0);
        set(handles.txtTimeEnd,'String',tf);
    end
    
    
    % Sampling period [s]
    Ts = 1/Fs;
    % Sample time [s]
    t = t0:Ts:(tf-Ts);
    
    % Reference pressure [Pa]
    pref = 0.001*str2double(get(handles.txtPref,'String'));
    % Conversion in dB(SPL)
    pdB = todB(p,pref);
    
    % Calculation of the sound pressure level LZI (Impulse)
    % Integration constant [s]
    TintI = 0.035;
    [LZI, LZImin, LZImax] = calcLp(p,Fs,pref,TintI);
    set(handles.txtLZImin,'String',LZImin);
    set(handles.txtLZImax,'String',LZImax);
    % Calculation of the sound pressure level LZF (Fast)
    % Integration constant [s]
    TintF = 0.125;
    [LZF, LZFmin, LZFmax] = calcLp(p,Fs,pref,TintF);
    set(handles.txtLZFmin,'String',LZFmin);
    set(handles.txtLZFmax,'String',LZFmax);
    % Calculation of the sound pressure level LZS (Slow)
    % Integration constant [s]
    TintS = 1;
    [LZS, LZSmin, LZSmax] = calcLp(p,Fs,pref,TintS);
    set(handles.txtLZSmin,'String',LZSmin);
    set(handles.txtLZSmax,'String',LZSmax);
    % Calculation of the impulse equivalent level LZIeq
    LZIeq = calcLIeq(p,Fs,pref);
    set(handles.txtLZIeq,'String',LZIeq);
    % Calculation of the equivalent level LZeq
    LZeq = calcLeq(p,Fs,pref);
    set(handles.txtLZeq,'String',LZeq);
    
    % Plot results
    plot(handles.graphP,t,2e-5/pref*p);
    xlim(handles.graphP,[t0 tf]);
    ylabel(handles.graphP,'Acoustic pressure [Pa]')
    set(handles.graphP,'XGrid','on','YGrid','on')
    
    % Spectrum
    [f, AmpdB, Bf, AmpBfZ, AmpBfA, AmpBfC] = SpectrumBands(p,Fs,pref,@rectwin);
    
    % Save variables
    handles.t0 = t0;
    handles.tf = tf;
    handles.t = t;
    handles.p = p;
    handles.pdB = pdB;
    handles.LZI = LZI;
    handles.LZF = LZF;
    handles.LZS = LZS;
    handles.f = f;
    handles.AmpdB = AmpdB;
    handles.Bf = Bf;
    handles.AmpBfZ = AmpBfZ;
    handles.AmpBfA = AmpBfA;
    handles.AmpBfC = AmpBfC;
    
catch err
    set(handles.checkSignal,'enable','off')
    set(handles.checkLZI,'enable','off')
    set(handles.checkLZF,'enable','off')
    set(handles.checkLZS,'enable','off')
    set(handles.checkContinu,'enable','off')
    set(handles.checkPondZ,'enable','off')
    set(handles.checkPondA,'enable','off')
    set(handles.checkPondC,'enable','off')
    CreateStruct.FontSize = 18;
    CreateStruct.WindowStyle = 'modal';
    CreateStruct.Interpreter = 'tex';
    uiwait(msgbox(['Bad file type: ' err.message],'Error','error',CreateStruct))
end

% Update handles structure
guidata(hObject, handles);













% --- Executes on button press in checkContinu.
%--------------------------------------------------------------------------
function checkContinu_Callback(hObject, eventdata, handles)
% hObject    handle to checkContinu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkContinu
isContinu = get(hObject,'Value');
isPondZ = get(handles.checkPondZ,'Value');
isPondA = get(handles.checkPondA,'Value');
isPondC = get(handles.checkPondC,'Value');
f = handles.f;
AmpdB = handles.AmpdB;
Bf = handles.Bf;
AmpBfZ = handles.AmpBfZ;
AmpBfA = handles.AmpBfA;
AmpBfC = handles.AmpBfC;

hold(handles.graphSp);
semilogx(handles.graphSp,f,isContinu.*AmpdB,'-k',Bf,isPondZ.*AmpBfZ,'-or',Bf,isPondA.*AmpBfA,'-sb',Bf,isPondC.*AmpBfC,'-xg')
xlim(handles.graphSp,[10 20000]);
xlabel(handles.graphSp,'Frequency [Hz]','fontsize',handles.FSax)
ylabel(handles.graphSp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in checkPondZ.
%--------------------------------------------------------------------------
function checkPondZ_Callback(hObject, eventdata, handles)
% hObject    handle to checkPondZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkPondZ
isContinu = get(handles.checkContinu,'Value');
isPondZ = get(hObject,'Value');
isPondA = get(handles.checkPondA,'Value');
isPondC = get(handles.checkPondC,'Value');
f = handles.f;
AmpdB = handles.AmpdB;
Bf = handles.Bf;
AmpBfZ = handles.AmpBfZ;
AmpBfA = handles.AmpBfA;
AmpBfC = handles.AmpBfC;

hold(handles.graphSp);
semilogx(handles.graphSp,f,isContinu.*AmpdB,'-k',Bf,isPondZ.*AmpBfZ,'-or',Bf,isPondA.*AmpBfA,'-sb',Bf,isPondC.*AmpBfC,'-xg')
xlim(handles.graphSp,[10 20000]);
xlabel(handles.graphSp,'Frequency [Hz]','fontsize',handles.FSax)
ylabel(handles.graphSp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in checkPondA.
%--------------------------------------------------------------------------
function checkPondA_Callback(hObject, eventdata, handles)
% hObject    handle to checkPondA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkPondA
isContinu = get(handles.checkContinu,'Value');
isPondZ = get(handles.checkPondZ,'Value');
isPondA = get(hObject,'Value');
isPondC = get(handles.checkPondC,'Value');
f = handles.f;
AmpdB = handles.AmpdB;
Bf = handles.Bf;
AmpBfZ = handles.AmpBfZ;
AmpBfA = handles.AmpBfA;
AmpBfC = handles.AmpBfC;

hold(handles.graphSp);
semilogx(handles.graphSp,f,isContinu.*AmpdB,'-k',Bf,isPondZ.*AmpBfZ,'-or',Bf,isPondA.*AmpBfA,'-sb',Bf,isPondC.*AmpBfC,'-xg')
xlim(handles.graphSp,[10 20000]);
xlabel(handles.graphSp,'Frequency [Hz]','fontsize',handles.FSax)
ylabel(handles.graphSp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in checkPondC.
%--------------------------------------------------------------------------
function checkPondC_Callback(hObject, eventdata, handles)
% hObject    handle to checkPondC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkPondC
isContinu = get(handles.checkContinu,'Value');
isPondZ = get(handles.checkPondZ,'Value');
isPondA = get(handles.checkPondA,'Value');
isPondC = get(hObject,'Value');
f = handles.f;
AmpdB = handles.AmpdB;
Bf = handles.Bf;
AmpBfZ = handles.AmpBfZ;
AmpBfA = handles.AmpBfA;
AmpBfC = handles.AmpBfC;

hold(handles.graphSp);
semilogx(handles.graphSp,f,isContinu.*AmpdB,'-k',Bf,isPondZ.*AmpBfZ,'-or',Bf,isPondA.*AmpBfA,'-sb',Bf,isPondC.*AmpBfC,'-xg')
xlim(handles.graphSp,[10 20000]);
xlabel(handles.graphSp,'Frequency [Hz]','fontsize',handles.FSax)
ylabel(handles.graphSp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);











% --- Executes on button press in checkSignal.
%--------------------------------------------------------------------------
function checkSignal_Callback(hObject, eventdata, handles)
% hObject    handle to checkSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkSignal
isSignal = get(hObject,'Value');
isLZI = get(handles.checkLZI,'Value');
isLZF = get(handles.checkLZF,'Value');
isLZS = get(handles.checkLZS,'Value');
t0 = handles.t0;
tf = handles.tf;
t = handles.t;
pdB = handles.pdB;
LZI = handles.LZI;
LZF = handles.LZF;
LZS = handles.LZS;

hold(handles.graphLp);
plot(handles.graphLp,t,isSignal.*pdB,'-k',t,isLZI.*LZI,'-r',t,isLZF.*LZF,'-b',t,isLZS.*LZS,'-g');
xlim(handles.graphLp,[t0 tf]);
xlabel(handles.graphLp,'Time [s]','fontsize',handles.FSax)
ylabel(handles.graphLp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in checkLZS.
%--------------------------------------------------------------------------
function checkLZS_Callback(hObject, eventdata, handles)
% hObject    handle to checkLZS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkLZS
isSignal = get(handles.checkSignal,'Value');
isLZI = get(handles.checkLZI,'Value');
isLZF = get(handles.checkLZF,'Value');
isLZS = get(hObject,'Value');
t0 = handles.t0;
tf = handles.tf;
t = handles.t;
pdB = handles.pdB;
LZI = handles.LZI;
LZF = handles.LZF;
LZS = handles.LZS;

hold(handles.graphLp);
plot(handles.graphLp,t,isSignal.*pdB,'-k',t,isLZI.*LZI,'-r',t,isLZF.*LZF,'-b',t,isLZS.*LZS,'-g');
xlim(handles.graphLp,[t0 tf]);
xlabel(handles.graphLp,'Time [s]','fontsize',handles.FSax)
ylabel(handles.graphLp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in checkLZF.
%--------------------------------------------------------------------------
function checkLZF_Callback(hObject, eventdata, handles)
% hObject    handle to checkLZF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkLZF
isSignal = get(handles.checkSignal,'Value');
isLZI = get(handles.checkLZI,'Value');
isLZF = get(hObject,'Value');
isLZS = get(handles.checkLZS,'Value');
t0 = handles.t0;
tf = handles.tf;
t = handles.t;
pdB = handles.pdB;
LZI = handles.LZI;
LZF = handles.LZF;
LZS = handles.LZS;

hold(handles.graphLp);
plot(handles.graphLp,t,isSignal.*pdB,'-k',t,isLZI.*LZI,'-r',t,isLZF.*LZF,'-b',t,isLZS.*LZS,'-g');
xlim(handles.graphLp,[t0 tf]);
xlabel(handles.graphLp,'Time [s]','fontsize',handles.FSax)
ylabel(handles.graphLp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in checkLZI.
%--------------------------------------------------------------------------
function checkLZI_Callback(hObject, eventdata, handles)
% hObject    handle to checkLZI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkLZI
isSignal = get(handles.checkSignal,'Value');
isLZI = get(hObject,'Value');
isLZF = get(handles.checkLZF,'Value');
isLZS = get(handles.checkLZS,'Value');
t0 = handles.t0;
tf = handles.tf;
t = handles.t;
pdB = handles.pdB;
LZI = handles.LZI;
LZF = handles.LZF;
LZS = handles.LZS;

hold(handles.graphLp);
plot(handles.graphLp,t,isSignal.*pdB,'-k',t,isLZI.*LZI,'-r',t,isLZF.*LZF,'-b',t,isLZS.*LZS,'-g');
xlim(handles.graphLp,[t0 tf]);
xlabel(handles.graphLp,'Time [s]','fontsize',handles.FSax)
ylabel(handles.graphLp,'[dB SPL]','fontsize',handles.FSax)
set(handles.graphSp,'XGrid','on','YGrid','on','fontsize',handles.FSax)

% Update handles structure
guidata(hObject, handles);
