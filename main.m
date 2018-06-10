function varargout = main(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 11-Aug-2017 18:44:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ReadImage.
function ReadImage_Callback(hObject, eventdata, handles)
% hObject    handle to ReadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = get(handles.editpath,'String');
axes(handles.axes1);
if(size(imread(filename),3) == 3)
    imshow(imadjust(rgb2gray(imread(filename))))
else
    imshow(imadjust(imread(filename)));
end
% --------------------------------------------------------------------
function CandyEating_Callback(hObject, eventdata, handles)
% hObject    handle to CandyEating (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function sliderbw_Callback(hObject, eventdata, handles)
% hObject    handle to sliderbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    bwThreshold = get(handles.sliderbw,'value');
    set(handles.editbw,'String',bwThreshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% axes(handles.axes2);
% finalRes = FindOverlapFunction(filename,1,1);
% imshow(finalRes);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function sliderbw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderat_Callback(hObject, eventdata, handles)
% hObject    handle to sliderat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    atThreshold = get(handles.sliderat,'value');
    set(handles.editat,'String',atThreshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderLOP1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderLOP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
try
    LOP1Threshold = get(handles.sliderLOP1,'value');
    set(handles.editLOP1,'String',LOP1Threshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end

% --- Executes during object creation, after setting all properties.
function sliderLOP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderLOP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderLOP2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderLOP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    LOP2Threshold = get(handles.sliderLOP2,'value');
    set(handles.editLOP2,'String',LOP2Threshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderLOP2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderLOP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderECT_Callback(hObject, eventdata, handles)
% hObject    handle to sliderECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    ECTThreshold = get(handles.sliderECT,'value');
    set(handles.editECT,'String',ECTThreshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderECT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderOSE1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderOSE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    OSE1Threshold = floor(get(handles.sliderOSE1,'value'));
    set(handles.editOSE1,'String',OSE1Threshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderOSE1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderOSE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderOSE2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderOSE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    OSE2Threshold = floor(get(handles.sliderOSE2,'value'));
    set(handles.editOSE2,'String',OSE2Threshold);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderOSE2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderOSE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in GO.
% The main function entrance
function GO_Callback(hObject, eventdata, handles)
% hObject    handle to GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = get(handles.editpath,'String');
% All the parameters in 'FindOverlapFunction' could be modified according to the performance.
% bwThreshold = str2num(get(handles.editbw,'String'));
bwThreshold = 0.8;
atThreshold = str2num(get(handles.editat,'String'))/255;
atWinSize = str2num(get(handles.editatsize,'String'));
% lop1 = str2num(get(handles.editLOP1,'String'));
lop1 = str2num(get(handles.editcl,'String'))/0.85*0.3;
% lop2 = str2num(get(handles.editLOP2,'String'));
lop2 = 0.2;
% ect = str2num(get(handles.editECT,'String'));
ect = 0.89;
% ose1 = str2num(get(handles.editOSE1,'String'));
ose1 = 5;
% ose2 = str2num(get(handles.editOSE2,'String'));
ose2 = 3;
axes(handles.axes2);
cla;cla reset;
%   The main implementation
[finalRes resGroup] = FindOverlapFunction(filename,bwThreshold,atWinSize,atThreshold,...
    lop1,lop2,ect,ose1,ose2);
finalProp = regionprops(im2bw(finalRes),'all');
if(size(imread(filename),3) == 3)
    imshow(imadjust(rgb2gray(imread(filename))))
else
    imshow(imadjust(imread(filename)));
end
%   If to show the cell label 
ifLabelOn = get(handles.radiobuttonCL,'Value');
%   To draw the cell region
hold on;DrawRegion(finalProp, ifLabelOn);
axes(handles.axes3);
set(handles.axes3,'visible', 'on');
cla;cla reset;
%   To show the cell number histogram
DrawGraph(finalProp);
%   To display cell information
data = ['Field' blanks(5) 'Orientation'];
for i = 1:size(finalProp,1)
    data = char(data,[num2str(i) blanks(10-size(num2str(i),2)) num2str(finalProp(i).Orientation)]);
end
set(handles.listbox1,'string',data);
function editbw_Callback(hObject, eventdata, handles)
% hObject    handle to editbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbw as text
%        str2double(get(hObject,'String')) returns contents of editbw as a double


% --- Executes during object creation, after setting all properties.
function editbw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editat_Callback(hObject, eventdata, handles)
% hObject    handle to editat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editat as text
%        str2double(get(hObject,'String')) returns contents of editat as a double


% --- Executes during object creation, after setting all properties.
function editat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLOP1_Callback(hObject, eventdata, handles)
% hObject    handle to editLOP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLOP1 as text
%        str2double(get(hObject,'String')) returns contents of editLOP1 as a double


% --- Executes during object creation, after setting all properties.
function editLOP1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLOP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLOP2_Callback(hObject, eventdata, handles)
% hObject    handle to editLOP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLOP2 as text
%        str2double(get(hObject,'String')) returns contents of editLOP2 as a double


% --- Executes during object creation, after setting all properties.
function editLOP2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLOP2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editECT_Callback(hObject, eventdata, handles)
% hObject    handle to editECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editECT as text
%        str2double(get(hObject,'String')) returns contents of editECT as a double


% --- Executes during object creation, after setting all properties.
function editECT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editECT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOSE1_Callback(hObject, eventdata, handles)
% hObject    handle to editOSE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOSE1 as text
%        str2double(get(hObject,'String')) returns contents of editOSE1 as a double


% --- Executes during object creation, after setting all properties.
function editOSE1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOSE1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editOSE2_Callback(hObject, eventdata, handles)
% hObject    handle to editOSE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOSE2 as text
%        str2double(get(hObject,'String')) returns contents of editOSE2 as a double


% --- Executes during object creation, after setting all properties.
function editOSE2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOSE2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slideratsize_Callback(hObject, eventdata, handles)
% hObject    handle to slideratsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    atsize = floor(get(handles.slideratsize,'value'));
    set(handles.editatsize,'String',atsize);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slideratsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slideratsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editatsize_Callback(hObject, eventdata, handles)
% hObject    handle to editatsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editatsize as text
%        str2double(get(hObject,'String')) returns contents of editatsize as a double


% --- Executes during object creation, after setting all properties.
function editatsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editatsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editpath_Callback(hObject, eventdata, handles)
% hObject    handle to editpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editpath as text
%        str2double(get(hObject,'String')) returns contents of editpath as a double


% --- Executes during object creation, after setting all properties.
function editpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonBrowse.
function pushbuttonBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.tif','Browse');
set(handles.editpath,'String',[pathname filename]);


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Visible','off');
% Hint: place code in OpeningFcn to populate axes3


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Label_CL.
function Label_CL_Callback(hObject, eventdata, handles)
% hObject    handle to Label_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Label_CL


% --- Executes during object creation, after setting all properties.
function Label_CL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Label_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slidercl_Callback(hObject, eventdata, handles)
% hObject    handle to slidercl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

try
    cl = get(handles.slidercl,'value');
    set(handles.editcl,'String',cl);
    guidata(hObject,handles);
catch ME
    errorMessage = printf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
		ME.stack(1).name, ME.stack(1).line, ME.message);
	WarnUser(errorMessage);
end
    
% --- Executes during object creation, after setting all properties.
function slidercl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slidercl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editcl_Callback(hObject, eventdata, handles)
% hObject    handle to editcl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editcl as text
%        str2double(get(hObject,'String')) returns contents of editcl as a double


% --- Executes during object creation, after setting all properties.
function editcl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editcl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function radiobuttonCL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobuttonCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobuttonCL.
function radiobuttonCL_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCL


% --- Executes during object creation, after setting all properties.
function pushbuttonBrowse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbuttonBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ReadImage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ReadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function GO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbuttonSave1.
function pushbuttonSave1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSave1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% F = getframe(handles.axes3);
% Image = frame2im(F);
newFig = figure('visible','off');
newAxes = copyobj(handles.axes3, newFig);
set(newAxes,'Units','default','Position','default'); 
F = getframe(newFig);
Image = frame2im(F);
imwrite(Image, ['Histo.jpg']);




% --- Executes during object creation, after setting all properties.
function pushbuttonSave1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbuttonSave1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbuttonSave2.
function pushbuttonSave2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSave2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = getframe(handles.axes2);
Image = frame2im(F);
imwrite(Image, 'Result.jpg');


% --- Executes on button press in pushbuttonExport.
function pushbuttonExport_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonExport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lbData = get(handles.listbox1,'String');
data = str2num(lbData(2:size(lbData,1),:));
if exist('Result.xls');
    delete('Result.xls');
end
xlswrite('Result.xls', data);