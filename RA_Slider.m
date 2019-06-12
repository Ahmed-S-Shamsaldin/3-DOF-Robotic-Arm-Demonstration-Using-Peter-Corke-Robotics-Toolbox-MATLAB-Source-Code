function varargout = testRA_Slider(varargin)
% TESTRA_SLIDER MATLAB code for testRA_Slider.fig
%      TESTRA_SLIDER, by itself, creates a new TESTRA_SLIDER or raises the existing
%      singleton*.
%
%      H = TESTRA_SLIDER returns the handle to a new TESTRA_SLIDER or the handle to
%      the existing singleton*.
%
%      TESTRA_SLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTRA_SLIDER.M with the given input arguments.
%
%      TESTRA_SLIDER('Property','Value',...) creates a new TESTRA_SLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testRA_Slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testRA_Slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testRA_Slider

% Last Modified by GUIDE v2.5 13-Jan-2019 15:25:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testRA_Slider_OpeningFcn, ...
                   'gui_OutputFcn',  @testRA_Slider_OutputFcn, ...
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


% --- Executes just before testRA_Slider is made visible.
function testRA_Slider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testRA_Slider (see VARARGIN)

% Choose default command line output for testRA_Slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testRA_Slider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testRA_Slider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_1 as text
%        str2double(get(hObject,'String')) returns contents of Theta_1 as a double


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_2 as text
%        str2double(get(hObject,'String')) returns contents of Theta_2 as a double


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_3 as text
%        str2double(get(hObject,'String')) returns contents of Theta_3 as a double


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_forward.
function btn_forward_Callback(hObject, eventdata, handles)
% hObject    handle to btn_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1 = str2double(handles.Theta_1.String)*pi/180;
Th_2 = str2double(handles.Theta_2.String)*pi/180;
Th_3 = str2double(handles.Theta_3.String)*pi/180;

L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';
Robot.plot([Th_1 Th_2 Th_3]);

T = Robot.fkine([Th_1 Th_2 Th_3]);
handles.Pos_X.String = num2str(floor(T.t(1)));
handles.Pos_Y.String = num2str(floor(T.t(2)));
handles.Pos_Z.String = num2str(floor(T.t(3)));

function Pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_X as text
%        str2double(get(hObject,'String')) returns contents of Pos_X as a double


% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double


% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_inverse.
function btn_inverse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.s_Theta_1.Value=0;
handles.s_Theta_2.Value=0;
handles.s_Theta_3.Value=0;

PX =  str2double(handles.Pos_X.String);
PY =  str2double(handles.Pos_Y.String);
PZ =  str2double(handles.Pos_Y.String);


L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';

T = [ 1 0 0 PX ;
      0 1 0 PY ; 
      0 0 1 PZ ; 
      0 0 0 1];

%   R.ikine(Td, 'q0', [rad1, rad2], 'mask',[1, 1, 0, 0, 0, 0]) 
J = Robot.ikcon(T);
J
handles.Theta_1.String = num2str(floor(J(1)));
handles.Theta_2.String = num2str(floor(J(2)));
handles.Theta_3.String = num2str(floor(J(3)));

Robot.plot(J*pi/180);


% --- Executes on slider movement.
function s_Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to s_Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Th_1 = get(handles.s_Theta_1,'Value')*pi/180;
Th_2 = get(handles.s_Theta_2,'Value')*pi/180;
Th_3 = get(handles.s_Theta_3,'Value')*pi/180;

handles.Theta_1.String =get(handles.s_Theta_1,'Value');
handles.Theta_2.String =get(handles.s_Theta_2,'Value');
handles.Theta_3.String =get(handles.s_Theta_3,'Value');

L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';
Robot.plot([Th_1 Th_2 Th_3]);

T = Robot.fkine([Th_1 Th_2 Th_3]);
handles.Pos_X.String = num2str(floor(T.t(1)));
handles.Pos_Y.String = num2str(floor(T.t(2)));
handles.Pos_Z.String = num2str(floor(T.t(3)));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s_Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over s_Theta_1.
function s_Theta_1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to s_Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function s_Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to s_Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1 = get(handles.s_Theta_1,'Value')*pi/180;
Th_2 = get(handles.s_Theta_2,'Value')*pi/180;
Th_3 = get(handles.s_Theta_3,'Value')*pi/180;

handles.Theta_1.String =get(handles.s_Theta_1,'Value');
handles.Theta_2.String =get(handles.s_Theta_2,'Value');
handles.Theta_3.String =get(handles.s_Theta_3,'Value');

L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';
Robot.plot([Th_1 Th_2 Th_3]);

T = Robot.fkine([Th_1 Th_2 Th_3]);
handles.Pos_X.String = num2str(floor(T.t(1)));
handles.Pos_Y.String = num2str(floor(T.t(2)));
handles.Pos_Z.String = num2str(floor(T.t(3)));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s_Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s_Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to s_Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1 = get(handles.s_Theta_1,'Value')*pi/180;
Th_2 = get(handles.s_Theta_2,'Value')*pi/180;
Th_3 = get(handles.s_Theta_3,'Value')*pi/180;

handles.Theta_1.String =get(handles.s_Theta_1,'Value');
handles.Theta_2.String =get(handles.s_Theta_2,'Value');
handles.Theta_3.String =get(handles.s_Theta_3,'Value');

L_1 = 20;
L_2 = 50;
L_3 = 40;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'RRR_Robot';
Robot.plot([Th_1 Th_2 Th_3]);

T = Robot.fkine([Th_1 Th_2 Th_3]);
handles.Pos_X.String = num2str(floor(T.t(1)));
handles.Pos_Y.String = num2str(floor(T.t(2)));
handles.Pos_Z.String = num2str(floor(T.t(3)));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s_Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
