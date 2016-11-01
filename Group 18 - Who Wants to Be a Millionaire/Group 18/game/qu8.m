function varargout = qu8(varargin)
% QU8 MATLAB code for qu8.fig
%      QU8, by itself, creates a new QU8 or raises the existing
%      singleton*.
%
%      H = QU8 returns the handle to a new QU8 or the handle to
%      the existing singleton*.
%
%      QU8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QU8.M with the given input arguments.
%
%      QU8('Property','Value',...) creates a new QU8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before qu8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to qu8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help qu8

% Last Modified by GUIDE v2.5 14-Jan-2016 23:25:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @qu8_OpeningFcn, ...
                   'gui_OutputFcn',  @qu8_OutputFcn, ...
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


% --- Executes just before qu8 is made visible.
function qu8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to qu8 (see VARARGIN)

% Choose default command line output for qu8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.axes1,'visible','off')
ques_8=fileread('questions_8.txt');
ans_8=fileread('answer_8.txt');
l=1:1:10;
n=length(l);
number=(randi(n));

ques=strsplit(ques_8,'!');
q=(ques{number});
ans=strsplit(ans_8,'!');
mc=(ans{number});
mcq=strsplit(mc,',');
A=mcq(1,1);
B=mcq(1,2);
C=mcq(1,3);
D=mcq(1,4);
set(handles.text2,'String',num2str(q));
set(handles.pushbutton5,'String',A);
set(handles.pushbutton6,'String',B);
set(handles.pushbutton7,'String',C);
set(handles.pushbutton8,'String',D);
drawnow()

fiftycheck = getappdata(0, 'fifty');
set(handles.fiftyfifty5050, 'enable', fiftycheck)
friendcheck = getappdata(0, 'friend');
set(handles.phonefriend, 'enable', friendcheck)
askcheck = getappdata(0, 'ask');
set(handles.askaudience, 'enable', askcheck)

h = imread('moneybar8.png');
axes(handles.axes2)
imshow(h);


% UIWAIT makes qu8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = qu8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in askaudience.
function askaudience_Callback(hObject, eventdata, handles)
% hObject    handle to askaudience (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = imread('graph 3.png');
axes(handles.axes1)
imshow(g);
pause (0)
set(handles.askaudience,'BackgroundColor','red')
askoff = 'off';
setappdata(0, 'ask', askoff)

% --- Executes on button press in phonefriend.
function phonefriend_Callback(hObject, eventdata, handles)
% hObject    handle to phonefriend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[y,Fs] = audioread('AskOptionC.wav');
sound(y,Fs);
pause (0)
set(handles.phonefriend,'BackgroundColor','red')
friendoff = 'off';
setappdata(0, 'friend', friendoff)


% --- Executes on button press in fiftyfifty5050.
function fiftyfifty5050_Callback(hObject, eventdata, handles)
% hObject    handle to fiftyfifty5050 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton6,'visible','off')
set(handles.pushbutton8,'visible','off')
pause (0)
set(handles.fiftyfifty5050,'BackgroundColor','red')
fiftyOff  = 'off';
setappdata(0, 'fifty', fiftyOff)

% --- Executes on button press in walkaway.
function walkaway_Callback(hObject, eventdata, handles)
% hObject    handle to walkaway (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawnow()
close 
run walkaway.m 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton5,'BackgroundColor','yellow')
set(handles.pushbutton6,'enable','off')
set(handles.pushbutton7,'enable','off')
set(handles.pushbutton8,'enable','off')
pause(2)
set(handles.pushbutton5,'string','Incorrect','ForegroundColor','Red','Backgroundcolor','cyan');
drawnow()
pause(2)
close
run gameedn.m

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton6,'backgroundcolor','yellow')
set(handles.pushbutton5,'enable','off')
set(handles.pushbutton7,'enable','off')
set(handles.pushbutton8,'enable','off')
pause(2)
set(handles.pushbutton6,'string','Incorrect','ForegroundColor','Red','backgroundcolor','cyan');
drawnow()
pause(2)
close
run gameedn.m

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton7,'backgroundcolor','yellow')
set(handles.pushbutton5,'enable','off')
set(handles.pushbutton6,'enable','off')
set(handles.pushbutton8,'enable','off')
pause(2)
set(handles.pushbutton7,'string','Congratulations!','ForegroundColor','Red','backgroundcolor','cyan');
set(handles.text2,'string','You have won �8000!')
drawnow()
pause(2)
close
run qu9.m


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton8,'backgroundcolor','yellow')
set(handles.pushbutton5,'enable','off')
set(handles.pushbutton6,'enable','off')
set(handles.pushbutton7,'enable','off')
pause(2)
set(handles.pushbutton8,'string','Incorrect','ForegroundColor','Red','backgroundcolor','cyan');
drawnow()
pause(2)
close
run gameedn.m


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
