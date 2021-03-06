function varargout = GenerateImageNoise(varargin)
% GENERATEIMAGENOISE MATLAB code for GenerateImageNoise.fig
%      GENERATEIMAGENOISE, by itself, creates a new GENERATEIMAGENOISE or raises the existing
%      singleton*.
%
%      H = GENERATEIMAGENOISE returns the handle to a new GENERATEIMAGENOISE or the handle to
%      the existing singleton*.
%
%      GENERATEIMAGENOISE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERATEIMAGENOISE.M with the given input arguments.
%
%      GENERATEIMAGENOISE('Property','Value',...) creates a new GENERATEIMAGENOISE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GenerateImageNoise_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GenerateImageNoise_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GenerateImageNoise

% Last Modified by GUIDE v2.5 28-Apr-2016 18:29:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GenerateImageNoise_OpeningFcn, ...
                   'gui_OutputFcn',  @GenerateImageNoise_OutputFcn, ...
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


% --- Executes just before GenerateImageNoise is made visible.
function GenerateImageNoise_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GenerateImageNoise (see VARARGIN)

% Choose default command line output for GenerateImageNoise
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GenerateImageNoise wait for user response (see UIRESUME)
% uiwait(handles.GenerateNoise);


% --- Outputs from this function are returned to the command line.
function varargout = GenerateImageNoise_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in AddNoise.
function AddNoise_Callback(hObject, eventdata, handles)
% hObject    handle to AddNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mean = str2num(get(handles.meanValue,'string'));
stdDev = str2num(get(handles.stdDevValue,'string'));

whiteGuassianNoise(mean, stdDev);

% --- Executes on slider movement.
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to meanText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
mean = get(hObject,'Value');
set(handles.meanValue,'string', mean);

% --- Executes during object creation, after setting all properties.
function meanText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meanText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function stdDev_Callback(hObject, eventdata, handles)
% hObject    handle to stdDev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
stdDev = get(hObject,'Value');
set(handles.stdDevValue,'string', stdDev);

% --- Executes during object creation, after setting all properties.
function stdDev_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stdDev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
stdDev = 5;
set(hObject,'string', stdDev);

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function meanValue_Callback(hObject, eventdata, handles)
% hObject    handle to meanValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of meanValue as text
%        str2double(get(hObject,'String')) returns contents of meanValue as a double
mean = get(hObject,'Value');
set(handles.mean,'string', mean);

% --- Executes during object creation, after setting all properties.
function meanValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meanValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% mean = 0;
% set(hObject,'string', mean);

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function stdDevValue_Callback(hObject, eventdata, handles)
% hObject    handle to stdDevValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stdDevValue as text
%        str2double(get(hObject,'String')) returns contents of stdDevValue as a double
stdDev = get(hObject,'Value');
set(handles.stdDev,'string', stdDev);

% --- Executes during object creation, after setting all properties.
function stdDevValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stdDevValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% stdDev = 5;
% set(hObject,'string', stdDev);

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function mean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in GenerateNV12Files.
function GenerateNV12Files_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateNV12Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rgb2nv12();
