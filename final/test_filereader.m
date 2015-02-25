function varargout = test_filereader(varargin)
% TEST_FILEREADER MATLAB code for test_filereader.fig
%      TEST_FILEREADER, by itself, creates drying new TEST_FILEREADER or raises the existing
%      singleton*.
%
%      H = TEST_FILEREADER returns the handle to drying new TEST_FILEREADER or the handle to
%      the existing singleton*.
%
%      TEST_FILEREADER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_FILEREADER.M with the given input arguments.
%
%      TEST_FILEREADER('Property','Value',...) creates drying new TEST_FILEREADER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_filereader_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_filereader_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_filereader

% Last Modified by GUIDE v2.5 25-Feb-2015 16:17:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_filereader_OpeningFcn, ...
                   'gui_OutputFcn',  @test_filereader_OutputFcn, ...
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


% --- Executes just before test_filereader is made visible.
function test_filereader_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_filereader (see VARARGIN)
load('defaultSpreadDryingProfil.mat');
defaultSpreadDryingProfil=defaultprofile; %load the file of default profil and save it. 
h = handles.figure1;
newIcon = javax.swing.ImageIcon('ICON_LOGO.jpg');
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标

% Choose default command line output for test_filereader
handles.output = defaultSpreadDryingProfil;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes test_filereader wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_filereader_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%varargout{1} = handles.defaultSpreadDryingProfil;



function file_path_Callback(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of file_path as text
%        str2double(get(hObject,'String')) returns contents of file_path as drying double


% --- Executes during object creation, after setting all properties.
function file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in readfile.
function readfile_Callback(hObject, eventdata, handles)
% hObject    handle to readfile (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[filename, pathname] = uigetfile({'*.STL;*.stl','all CAD Files';...
          '*.*','All Files' });
if isequal(filename,0) || isequal(pathname,0)
return;
end
set(handles.file_path,'String',[pathname,filename]);


a = get(handles.file_path,'String');
[vertices, tessellation]=readStl(a);
% % assignin('base','vertices',vertices);
% % assignin('base','tessellation',tessellation);
fv.faces=tessellation;
fv.vertices=vertices;
%assignin('base','fv',fv);
axes(handles.axes);
cla(handles.axes);
patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);

% Add drying camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

% Fix the axes scaling, and set drying nice view angle
axis('image');
view([-135 35]);



function Spreading_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to Spreading_Speed (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Spreading_Speed as text
%        str2double(get(hObject,'String')) returns contents of Spreading_Speed as drying double


% --- Executes during object creation, after setting all properties.
function Spreading_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Spreading_Speed (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Printing_Saturation_Callback(hObject, eventdata, handles)
% hObject    handle to Printing_Saturation (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Printing_Saturation as text
%        str2double(get(hObject,'String')) returns contents of Printing_Saturation as drying double


% --- Executes during object creation, after setting all properties.
function Printing_Saturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Printing_Saturation (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Powder_Recycle_Ratio_Callback(hObject, eventdata, handles)
% hObject    handle to Powder_Recycle_Ratio (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Powder_Recycle_Ratio as text
%        str2double(get(hObject,'String')) returns contents of Powder_Recycle_Ratio as drying double


% --- Executes during object creation, after setting all properties.
function Powder_Recycle_Ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Powder_Recycle_Ratio (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Layer_Thickness_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_Thickness (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Layer_Thickness as text
%        str2double(get(hObject,'String')) returns contents of Layer_Thickness as drying double


% --- Executes during object creation, after setting all properties.
function Layer_Thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_Thickness (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Drying_Power_Callback(hObject, eventdata, handles)
% hObject    handle to Drying_Power (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Drying_Power as text
%        str2double(get(hObject,'String')) returns contents of Drying_Power as drying double


% --- Executes during object creation, after setting all properties.
function Drying_Power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Drying_Power (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Drying_Time_Callback(hObject, eventdata, handles)
% hObject    handle to Drying_Time (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input=get(hObject,'String');
if (isempty(input))
    set(hObject,'String','unknown')
end
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Drying_Time as text
%        str2double(get(hObject,'String')) returns contents of Drying_Time as drying double


% --- Executes during object creation, after setting all properties.
function Drying_Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Drying_Time (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.xls;*.xlsx;*.xlsm','all Excel Files';...
          '*.*','All Files' });
if isequal(filename,0) || isequal(pathname,0)
return;
end
set(handles.File_Path_Power,'String',[pathname,filename]);





function File_Path_Learn_STL_Callback(hObject, eventdata, handles)
% hObject    handle to File_Path_Learn_STL (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of File_Path_Learn_STL as text
%        str2double(get(hObject,'String')) returns contents of File_Path_Learn_STL as drying double


% --- Executes during object creation, after setting all properties.
function File_Path_Learn_STL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to File_Path_Learn_STL (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.STL;*.stl','all CAD Files';...
          '*.*','All Files' });
if isequal(filename,0) || isequal(pathname,0)
return;
end
set(handles.File_Path_Learn_STL,'String',[pathname,filename]);


a = get(handles.File_Path_Learn_STL,'String');
[vertices, tessellation]=readStl(a);
% % assignin('base','vertices',vertices);
% % assignin('base','tessellation',tessellation);
fv.faces=tessellation;
fv.vertices=vertices;
%assignin('base','fv',fv);
axes(handles.axes);
cla(handles.axes);
patch(fv,'FaceColor',       [0.8 0.8 1.0], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);

% Add drying camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

% Fix the axes scaling, and set drying nice view angle
axis('image');
view([-135 35]);
intersectlayer=slicelayer(a);

% Delete Void Cells of the layer information
intersectlayer=deletevoidcell(intersectlayer,0.1);
assignin('base','Learn_intersectlayer',intersectlayer);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(handles.File_Path_Power,'String');
DataFilePath=a;
data = xlsread(DataFilePath,'printing power' );
time=data(1,:);
power=data(2,:);

power_fd=FirstDiff(power,time);
power_fd_filt=GaussFilter(power_fd,2);
[~,pff_locs_i,~,pff_locs_d]=LocatePeaks(power_fd_filt,0.0004);

% get change points------------------------------------------------------

a=size(pff_locs_i,2);
b=size(pff_locs_d,2);
length=a+b;
i=1;
j=1;
k=1;
f=1;
while(i<=length)
    if pff_locs_i(j)<=pff_locs_d(k)
       change.locs(i)=pff_locs_i(j);
       change.type(i)=1;
       if  j<a
           j=j+1;
       end
       if j==a
           for f=i:length
           change.locs(f)=pff_locs_d(f-a);
           change.type(f)=-1;    
           end  
           break;
       end
    
    else %time(pff_locs_i(j))>time(pff_locs_d(k))
       change.locs(i)=pff_locs_d(k);
       change.type(i)=-1;
       if  k<b
           k=k+1;
       end
       if k==b
           for f=i:length
           change.locs(f)=pff_locs_i(f-b);
           change.type(f)=1;    
           end  
           break;
       end
    end
    i=i+1;
end

% get valid data------------------------------------------------------

length=size(change.type,2);
length=length-3;
validlocs.point1=[];
validlocs.point2=[];
validlocs.point3=[];
validlocs.point4=[];
validlocs.layer=[];
for i=2:length
    if (change.type(i-1)==-1&&change.type(i)==1&&change.type(i+1)==1&&change.type(i+2)==-1&&change.type(i+3)==1)
        validlocs.point1(end+1)=change.locs(i);
        validlocs.point2(end+1)=change.locs(i+1);
        validlocs.point3(end+1)=change.locs(i+2);
        validlocs.point4(end+1)=change.locs(i+3);
    end
end

% figure out the corresponding layers of operations---------------------
power_filt=GaussFilter(power,5);
inverse_power=-power_filt;
[~,locs] = findpeaks(inverse_power);
timeoflayer=[ 1 locs size(time,2)];

length=size(timeoflayer,2);
length=length-1;
lengthofvalidlocs=size(validlocs.point1,2);
startlocs=1;
for i=1:length
    for  j=startlocs:lengthofvalidlocs
        if (validlocs.point1(j)>=timeoflayer(i) && validlocs.point1(j)<timeoflayer(i+1))
            validlocs.layer(j)=i;
%          startlocs=j+1;   
        end
    end
end

%calculate average power---------------------------------------------------------------------------------------
length=size(validlocs.point1,2);
spread.power=[];
spread.time=[];
spread.layer=[];
print.power=[];
print.time=[];
print.layer=[];
dry.power=[];
dry.time=[];
dry.layer=[];
averagepower=0;
for i=1:length
    averagepower=0;
    for j=validlocs.point1(i):validlocs.point2(i)
        averagepower=averagepower+power(j);
    end
    spread.power(end+1)=averagepower/(validlocs.point2(i)-validlocs.point1(i)+1);
    spread.time(end+1)=time(validlocs.point2(i))-time(validlocs.point1(i));
    spread.layer(end+1)=validlocs.layer(i);
    averagepower=0;
    for j=validlocs.point2(i):validlocs.point3(i)
        averagepower=averagepower+power(j);
    end
    print.power(end+1)=averagepower/(validlocs.point3(i)-validlocs.point2(i)+1);
    print.time(end+1)=time(validlocs.point3(i))-time(validlocs.point2(i));
    print.layer(end+1)=validlocs.layer(i);
    averagepower=0;
    for j=validlocs.point3(i):validlocs.point4(i)
        averagepower=averagepower+power(j);
    end
    dry.power(end+1)=averagepower/(validlocs.point4(i)-validlocs.point3(i)+1);
    dry.time(end+1)=time(validlocs.point4(i))-time(validlocs.point3(i));
    dry.layer(end+1)=validlocs.layer(i);
end
Power.Drying=mean(dry.power);
Power.Spreading=mean(spread.power);
Power.Printing=mean(print.power);
assignin('base','Power',Power);
set(handles.Drying,'String',Power.Drying);
set(handles.Spreading,'String',Power.Spreading);
set(handles.Printing,'String',Power.Printing);

% Regress the motion equation of PrintHead--------------------------------
intersectlayer=evalin('base','Learn_intersectlayer');
layerNum=size(intersectlayer,2);

for i=1:layerNum
    [la(i),xlimit{i},ylimit{i}]=slicebar(intersectlayer{i});
end
RegData.Time=print.time;
RegData.Ylimits=ylimit(print.layer);
length=size(RegData.Ylimits,2);
for i=1:length;
    ymax(i)=RegData.Ylimits{i}(1,2);
    ymin(i)=RegData.Ylimits{i}(1,1);
end
f=fit([ymax',ymin'],RegData.Time','poly11');
coefficient.c1=f.p10;
coefficient.c2=f.p01;
coefficient.c3=f.p00;
assignin('base','coefficient',coefficient);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Clean_Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Clean_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Clean_Frequency as text
%        str2double(get(hObject,'String')) returns contents of Clean_Frequency as a double


% --- Executes during object creation, after setting all properties.
function Clean_Frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Clean_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layer_Thickness as text
%        str2double(get(hObject,'String')) returns contents of Layer_Thickness as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderSurfaceRoughness_Callback(hObject, eventdata, handles)
% hObject    handle to sliderSurfaceRoughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pp = get(handles.sliderSurfaceRoughness, 'value');
set(handles.text54, 'string', pp);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderSurfaceRoughness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderSurfaceRoughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to Printing_Saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Printing_Saturation as text
%        str2double(get(hObject,'String')) returns contents of Printing_Saturation as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Printing_Saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Heater_Power_Ratio_Callback(hObject, eventdata, handles)
% hObject    handle to Heater_Power_Ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Heater_Power_Ratio as text
%        str2double(get(hObject,'String')) returns contents of Heater_Power_Ratio as a double


% --- Executes during object creation, after setting all properties.
function Heater_Power_Ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Heater_Power_Ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to Drying_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Drying_Time as text
%        str2double(get(hObject,'String')) returns contents of Drying_Time as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Drying_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderDimensionalY_Callback(hObject, eventdata, handles)
% hObject    handle to sliderDimensionalY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pp = get(handles.sliderDimensionalY, 'value');
set(handles.text55, 'string', pp);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderDimensionalY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderDimensionalY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SliderDimensionalZ_Callback(hObject, eventdata, handles)
% hObject    handle to SliderDimensionalZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pp = get(handles.SliderDimensionalZ, 'value');
set(handles.text56, 'string', pp);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function SliderDimensionalZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderDimensionalZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('predictRaValue.mat');
load('predictShrinkageYValue.mat')
load('predictShrinkageZValue.mat')
load('parameterDatabase.mat');

pp1 = get(handles.sliderSurfaceRoughness, 'value');
pp1 = 1 - pp1 / 100;
pp2 = get(handles.sliderDimensionalY, 'value');
pp2 = 1 - pp2 / 100;
pp3 = get(handles.SliderDimensionalZ, 'value');
pp3 = 1 - pp3 / 100;

A = zeros(1,16000);
for i = 1:16000
   if (predictRa(1,i) <= (pp1 * (max(predictRa) - min(predictRa)) + min(predictRa)))
     A(i) = A(i) + 1;
   end
end

for i = 1:16000
   if (PredictValueShrinkageY(1,i) <= (pp2 * (max(PredictValueShrinkageY) - min(PredictValueShrinkageY)) + min(PredictValueShrinkageY)))
     A(i) = A(i) + 1;
   end
end

for i = 1:16000
   if (PredictShrinkageZValue(1,i) <= (pp3 * (max(PredictShrinkageZValue) - min(PredictShrinkageZValue)) + min(PredictShrinkageZValue)))
     A(i) = A(i) + 1;
   end
end
fileName = get(handles.file_path,'String');
[vertices, tessellation] = readStl(fileName);
[triBottomList, triTopList] = buildTopBotLists(vertices, tessellation);
zLimits = [min(vertices(:,3)) max(vertices(:,3))];
heightZ = (zLimits(2) - zLimits(1)) * 1000;

minTimePosition = 0;
minTimeValue = 100000000;

for i = 1:16000
   if (A(i) == 3)
      %calculation the printing time
      LayerNum = heightZ / parameterDatabase(1,i);
      timeSub1 = (400 * 2 + 30 * 7 * 2) / 70 + 4;
      timeSub2 = 27.33 + (2 * 120 - 50) / 5;
      timeSub3 = parameterDatabase(4,i);
      timeSub4 = 60 / 11;
      timeToal = LayerNum * (timeSub1 + timeSub2 + timeSub3 + timeSub4);
      if timeToal <= minTimeValue
         minTimePosition = i;
         minTimeValue = timeToal;
      end
   end
end
if minTimePosition == 0
    errordlg('No Solution, Please Modify Your Quality Requirement','Error!');
else
    newSpreadSpeedProfileTable = get(handles.SpreadSpeedTable, 'data');
    newSpreadSpeedProfileTable(:,2,:) = parameterDatabase(4, minTimePosition); %set the drying time to the optimal value
    set(handles.Layer_Thickness, 'string',  parameterDatabase(1, minTimePosition));
    set(handles.Printing_Saturation, 'string',  parameterDatabase(2, minTimePosition));
    set(handles.Heater_Power_Ratio, 'string',  parameterDatabase(3, minTimePosition));
    set(handles.Drying_Time, 'string',  parameterDatabase(4, minTimePosition));
    set(handles.Surface_Roughness, 'string',  predictRa(1, minTimePosition));
    set(handles.Shrinkage_Y, 'string',  PredictValueShrinkageY(1, minTimePosition)*100);
    set(handles.Shrinkage_Z, 'string',  PredictShrinkageZValue(1, minTimePosition)*100);
    set(handles.Optimal_Printing_Time, 'string', minTimeValue);
    set(handles.InitialDryingTimeEditor, 'string', parameterDatabase(4, minTimePosition)); % set the initial drying time to the optimal value
    set(handles.SpreadSpeedTable, 'data', newSpreadSpeedProfileTable);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.sliderSurfaceRoughness, 'value', 0);
set(handles.sliderDimensionalY, 'value', 0);
set(handles.SliderDimensionalZ, 'value', 0);
set(handles.Layer_Thickness, 'string', 0);
set(handles.Heater_Power_Ratio, 'string', 0);
set(handles.Printing_Saturation, 'string', 0);
set(handles.Drying_Time, 'string', 0);
set(handles.Surface_Roughness, 'string', 0);
set(handles.Shrinkage_Y, 'string', 0);
set(handles.Shrinkage_Z, 'string', 0);
set(handles.Optimal_Printing_Time, 'string', 0);
set(handles.text54, 'string', 0);
set(handles.text55, 'string', 0);
set(handles.text56, 'string', 0);







% --- Executes on key press with focus on sliderSurfaceRoughness and none of its controls.
function sliderSurfaceRoughness_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to sliderSurfaceRoughness (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function Surface_Roughness_Callback(hObject, eventdata, handles)
% hObject    handle to Surface_Roughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Surface_Roughness as text
%        str2double(get(hObject,'String')) returns contents of Surface_Roughness as a double


% --- Executes during object creation, after setting all properties.
function Surface_Roughness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Surface_Roughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Shrinkage_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Shrinkage_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shrinkage_Z as text
%        str2double(get(hObject,'String')) returns contents of Shrinkage_Z as a double


% --- Executes during object creation, after setting all properties.
function Shrinkage_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shrinkage_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Shrinkage_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Shrinkage_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shrinkage_Y as text
%        str2double(get(hObject,'String')) returns contents of Shrinkage_Y as a double


% --- Executes during object creation, after setting all properties.
function Shrinkage_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shrinkage_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Optimal_Printing_Time_Callback(hObject, eventdata, handles)
% hObject    handle to Optimal_Printing_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Optimal_Printing_Time as text
%        str2double(get(hObject,'String')) returns contents of Optimal_Printing_Time as a double


% --- Executes during object creation, after setting all properties.
function Optimal_Printing_Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Optimal_Printing_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function InitialSpreadSpeedEditor_Callback(hObject, eventdata, handles)
% hObject    handle to InitialSpreadSpeedEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InitialSpreadSpeedEditor as text
%        str2double(get(hObject,'String')) returns contents of InitialSpreadSpeedEditor as a double
initialSpreadSpeed = str2double(get(hObject,'string'));
if isnan(initialSpreadSpeed)
errordlg('You must enter a numeric value','Invalid Input','modal')
uicontrol(hObject)
return
else
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function InitialSpreadSpeedEditor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitialSpreadSpeedEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InitialDryingTimeEditor_Callback(hObject, eventdata, handles)
% hObject    handle to InitialDryingTimeEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initialDryingTime = str2double(get(hObject,'string'));
if isnan(initialDryingTime)
errordlg('You must enter a numeric value','Invalid Input','modal')
uicontrol(hObject)
return
else
guidata(hObject, handles);
end
DryingSpreadingProfil=get(handles.SpreadSpeedTable,'data');
DryingSpreadingProfil(:,2,:)=str2double(get(hObject,'string'));
set(handles.SpreadSpeedTable, 'data', DryingSpreadingProfil);
% Hints: get(hObject,'String') returns contents of InitialDryingTimeEditor as text
%        str2double(get(hObject,'String')) returns contents of InitialDryingTimeEditor as a double


% --- Executes during object creation, after setting all properties.
function InitialDryingTimeEditor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitialDryingTimeEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CuringTemperatureEditor_Callback(hObject, eventdata, handles)
% hObject    handle to CuringTemperatureEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
curingTemp= str2double(get(hObject,'string'));
if isnan(curingTemp)
errordlg('You must enter a numeric value','Invalid Input','modal')
uicontrol(hObject)
return
else
guidata(hObject, handles);
end
% Hints: get(hObject,'String') returns contents of CuringTemperatureEditor as text
%        str2double(get(hObject,'String')) returns contents of CuringTemperatureEditor as a double


% --- Executes during object creation, after setting all properties.
function CuringTemperatureEditor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CuringTemperatureEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CuringHoldTimeEditor_Callback(hObject, eventdata, handles)
% hObject    handle to CuringHoldTimeEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
curingHoldTime= str2double(get(hObject,'string'));
if isnan(curingHoldTime)
errordlg('You must enter a numeric value','Invalid Input','modal')
uicontrol(hObject)
return
else
guidata(hObject, handles);
end
% Hints: get(hObject,'String') returns contents of CuringHoldTimeEditor as text
%        str2double(get(hObject,'String')) returns contents of CuringHoldTimeEditor as a double


% --- Executes during object creation, after setting all properties.
function CuringHoldTimeEditor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CuringHoldTimeEditor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SinteringProfileSelection.
function SinteringProfileSelection_Callback(hObject, eventdata, handles)
% hObject    handle to SinteringProfileSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sinteringProfile = str2double(get(hObject,'string'));
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns SinteringProfileSelection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SinteringProfileSelection


% --- Executes during object creation, after setting all properties.
function SinteringProfileSelection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SinteringProfileSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CalculateTimeButton.
function CalculateTimeButton_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateTimeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('parameterDatabase.mat');
initialDryingTime=str2double(get(handles.InitialDryingTimeEditor, 'string'));
initialSpreadSpeed=str2double(get(handles.InitialSpreadSpeedEditor, 'string'));
DryingSpreadingProfile=get(handles.SpreadSpeedTable, 'data');

curingTemperature=str2double(get(handles.CuringTemperatureEditor, 'string'));
curingHoldTime=str2double(get(handles.CuringHoldTimeEditor, 'string'))*3600; % transfer hours into seconds
sinteringProfile=get(handles.SinteringProfileSelection, 'value');
if (isempty(get(handles.Layer_Thickness, 'string')))
    errordlg('Please set up the Layer thickness(input yourself or using the recommandation ','Invalid Input','modal');
else 
layerThickness=str2double(get(handles.Layer_Thickness,'string'));
end
if (isempty(get(handles.Printing_Saturation, 'string')))
    errordlg('Please set up the Printing Saturation (input yourself or using the recommandation ','Invalid Input','modal');
else 
printingSaturation=str2double(get(handles.Printing_Saturation,'string'));
end

fileName = get(handles.file_path,'String');
[vertices, tessellation] = readStl(fileName);
[triBottomList, triTopList] = buildTopBotLists(vertices, tessellation);
zLimits = [min(vertices(:,3)) max(vertices(:,3))];
heightZ = (zLimits(2) - zLimits(1)) * 1000;
LayerNum = ceil(heightZ/layerThickness); % round the layerthickness to the larger integer

%calculate the part volume from STL file
intersectlayer=slicelayer(fileName,(layerThickness/1000));
intersectlayer=deletevoidcell(intersectlayer);

for i=1:(LayerNum-1)
    [layerArea(i),xlimit{i},ylimit{i}] = slicebar(intersectlayer{i});
end
packRate = 0.52;
layerPerCleaning = 13; 
binderPerCleaning = 24; % an estimation value
cleanerPerCleaning = 73;
binderNeededInitialization = 48;
cleanerNeededInitialization = 103; 
partVolume = (sum(layerArea) + layerArea(1)) * (layerThickness/1000); %the first layer area is the same as the second layer area, previous calculation ignore the first layer
%calculate the powder consumption and binder consumption
powderNeededPrinting = partVolume * 4.0741; % equivalent density of the 52% dense steel powder
partWeight = powderNeededPrinting;
powderNeededActual = powderNeededPrinting * 1.14; % it is assumed that 14% of the powder are wasted
binderNeededPrinting = printingSaturation/100 * partVolume * packRate;
binderNeededCleaning = fix(LayerNum / layerPerCleaning) * binderPerCleaning;
cleanerNeededCleaning = fix(LayerNum / layerPerCleaning) * cleanerPerCleaning;
totalBinderConsumption = binderNeededPrinting + binderNeededCleaning + binderNeededInitialization;
totalCleanerConsumption = cleanerNeededCleaning + cleanerNeededInitialization;
binderEfficiency = (binderNeededPrinting / totalBinderConsumption) * 100;
liquidWaste = totalCleanerConsumption + binderNeededCleaning + binderNeededInitialization;
solidWaste = powderNeededPrinting * 0.14;
wasteRatio = liquidWaste / partWeight;
binderRatio = totalBinderConsumption / partWeight;
cleanerRatio = totalCleanerConsumption / partWeight;
% curing time estimation
roomTemperature = 25;
% the curing oven temperature rising rate is 5 degree/mins and cooling rate
% is 1.2 degree/mins
curingTempRisingTime = (curingTemperature - roomTemperature)*60/5; % tranform the time into seconds.
curingTempLoweringTime = (curingTemperature - roomTemperature)*60/1.2; 
curingTimeEstimation = curingTempRisingTime + curingHoldTime + curingTempLoweringTime;

%sintering time estimation refer to the sintering profil manual for detail
%data
if (sinteringProfile == 1) %S4-One Step
    sinteringTimeEstimation = 398 * 60;
elseif (sinteringProfile == 2) %Bronze Infiltration
    sinteringTimeEstimation = 339 * 60;
elseif (sinteringProfile == 3) %S4 Sintering
    sinteringTimeEstimation = 394 * 60;
end

%printing Time estimation
%initialization Time
initializationTime = 600; %data get from experiments
% printhead pass time
printheadPassNum = 8; %printhead pass per layer printed
printheadPassSpeed = 18; %printhead average moving speed 18 mm/s
printheadPassDistance = 280; % the distance between the printhead position to the platform;
timeLayerPrintheadPass = printheadPassDistance*printheadPassNum*2/printheadPassSpeed; % time in seconds
timePrintheadPass = timeLayerPrintheadPass * LayerNum;

%time to heating place and back
platformSpeed = 25; %average speed of platform moving from printing postion to heating position
platformHeatingDistance = 320; %the distance from the printing position to the heating position
platformMovingBackDistance =280;% the distance from the spreading postion to the printing postion
platformMovingTimeLayer = (platformHeatingDistance + platformMovingBackDistance)/platformSpeed;
timePlatformMoving = platformMovingTimeLayer * LayerNum;

%time of heating
if (LayerNum <=120 && LayerNum >= 5)
    heatingTime = initialDryingTime * 5 + sum(DryingSpreadingProfile(1:fix(LayerNum/5),2))*5 + mod(LayerNum,5)*(DryingSpreadingProfile(fix(LayerNum/5)+1,2));
elseif (LayerNum >=120)
    heatingTime = initialDryingTime * 5 + sum(DryingSpreadingProfile(1:24,2))*5 + (LayerNum - 120) * DryingSpreadingProfile(24,2);
else
    heatingTime = LayerNum * initialDryingTime
end
    
% time of spreading
spreadDistance = 40; % the spreading distance 
if (LayerNum <=120 && LayerNum >= 5)
    for i=1:fix(LayerNum/5)
        spreadtimelayer(i)= spreadDistance/DryingSpreadingProfile(i,3);
    end
    spreadTime = (spreadDistance/initialSpreadSpeed) * 5 + sum(spreadtimelayer) * 5 + mod(LayerNum,5) * spreadDistance/(DryingSpreadingProfile(fix(LayerNum/5)+1,3));
elseif (LayerNum >=120)
    for i=1:24
        spreadtimelayer(i)= spreadDistance/DryingSpreadingProfile(i,3);
    end
    spreadTime = (spreadDistance/initialSpreadSpeed) * 5 + sum(spreadtimelayer) * 5 + (LayerNum - 120) * (spreadDistance/DryingSpreadingProfile(24,3));
else
    spreadTime = (spreadDistance/initialSpreadSpeed) * LayerNum;
end

% time of auto cleaning


autocleaningTime = 360; % refer to user manual of the printer
autocleaningTotalTime = (fix(LayerNum/layerPerCleaning)- 1) * autocleaningTime;
totalPrintingTimeEstimation = initializationTime + timePrintheadPass + timePlatformMoving + heatingTime + spreadTime + autocleaningTotalTime;

% manual working time from the experiments
printingPreparationTime = 20 * 60;
curingPreparationTime = 5 * 60;
depowderTime = 10 * 60;
sinteringPreparationTime = 5* 60;
manualWorkTime = depowderTime + sinteringPreparationTime + curingPreparationTime + printingPreparationTime;

%material consumption


%KPI related Time parameter
%%busy Time
totalSinteringFurnaceBusyTime = sinteringTimeEstimation + sinteringPreparationTime;
totalCuringOvenBusyTime = curingTimeEstimation + curingPreparationTime + depowderTime;
totalPrinterBusyTime = totalPrintingTimeEstimation + printingPreparationTime; 
totalBusyTime = totalPrinterBusyTime + totalCuringOvenBusyTime + totalSinteringFurnaceBusyTime;
%%Operation Time
sinteringOperationTime = sinteringTimeEstimation;
curingOperationTime = curingTimeEstimation;
printingOperationTime = timePrintheadPass + heatingTime + spreadTime + timePlatformMoving; % no autocleaning is counted
mainUsageTime = sinteringOperationTime + curingOperationTime + printingOperationTime; 
%%Availability
availabilityPrint = (1 - totalPrinterBusyTime / totalBusyTime) * 100; 
availabilityCuring = (1 -  totalCuringOvenBusyTime / totalBusyTime) * 100;
availabilitySintering = (1 -  totalSinteringFurnaceBusyTime / totalBusyTime) * 100;
availabilityTotal = 0; % since no machine breaking down is considered
%%Efficiency
efficiencyPrint = (printingOperationTime / totalPrinterBusyTime) * 100;
efficiencyCuring = (curingOperationTime / totalCuringOvenBusyTime) * 100;
efficiencySintering = (sinteringOperationTime / totalSinteringFurnaceBusyTime) * 100;
efficiencyTotal = (mainUsageTime  / totalBusyTime) * 100;
%%Preparation degree: only preparation is considered, initialization and
%%depowdering is not considered as preparation
preparationDegreePrint = (printingPreparationTime / totalPrinterBusyTime) * 100;
preparationDegreeCuring = (curingPreparationTime / totalCuringOvenBusyTime) * 100;
preparationDegreeSintering = (sinteringPreparationTime / totalSinteringFurnaceBusyTime) * 100;
preparationDegreeTotal = ((printingPreparationTime + curingPreparationTime + sinteringPreparationTime) / totalBusyTime) * 100;

% display the result on the interface
totalTime = totalBusyTime;
totalTimeHours = totalTime / 3600 ; 
set(handles.PartVolume, 'string', partVolume);
set(handles.PartVolume, 'value', partVolume);
set(handles.CuringTimeEstimation, 'string', curingTimeEstimation);
set(handles.CuringTimeEstimation, 'value', curingTimeEstimation);
set(handles.SinteringTimeEstimation, 'string', sinteringTimeEstimation);
set(handles.SinteringTimeEstimation, 'value', sinteringTimeEstimation);
set(handles.PrintingTimeEstimation, 'string', totalPrintingTimeEstimation);
set(handles.PrintingTimeEstimation, 'value', totalPrintingTimeEstimation);
set(handles.ManualWorkTimeEstimation, 'string', manualWorkTime);
set(handles.TotalTimeEstimationSeconds, 'string', totalTime);
set(handles.TotalTimeEstimationSeconds, 'value', totalTime);
set(handles.TotalTimeEstimationHours, 'string', totalTimeHours);
set(handles.TotalTimeEstimationHours, 'value', totalTimeHours);
set(handles.MainUsageTimeTotal, 'string', mainUsageTime);
set(handles.MainUsageTimeTotal, 'value', mainUsageTime);
set(handles.MainUsageTimePrint, 'string', printingOperationTime);
set(handles.MainUsageTimePrint, 'value', printingOperationTime);
set(handles.MainUsageTimeCuring, 'string', curingOperationTime);
set(handles.MainUsageTimeCuring, 'value', curingOperationTime);
set(handles.MainUsageTimeSintering, 'string', sinteringOperationTime);
set(handles.MainUsageTimeSintering, 'value', sinteringOperationTime);
set(handles.BusyTimeTotal, 'string', totalBusyTime);
set(handles.BusyTimeTotal, 'value', totalBusyTime);
set(handles.BusyTimePrint, 'string', totalPrinterBusyTime);
set(handles.BusyTimePrint, 'value', totalPrinterBusyTime);
set(handles.BusyTimeCuring, 'string', totalCuringOvenBusyTime);
set(handles.BusyTimeCuring, 'value', totalCuringOvenBusyTime);
set(handles.BusyTimeSintering, 'string', totalSinteringFurnaceBusyTime);
set(handles.BusyTimeSintering, 'value', totalSinteringFurnaceBusyTime);
set(handles.AvailabilityTotal, 'string', availabilityTotal);
set(handles.AvailabilityTotal, 'value', availabilityTotal);
set(handles.AvailabilityPrint, 'string', availabilityPrint);
set(handles.AvailabilityPrint, 'value', availabilityPrint);
set(handles.AvailabilityCuring, 'string', availabilityCuring);
set(handles.AvailabilityCuring, 'value', availabilityCuring);
set(handles.AvailabilitySintering, 'string', availabilitySintering);
set(handles.AvailabilitySintering, 'value', availabilitySintering);
set(handles.EfficiencyTotal, 'string', efficiencyTotal);
set(handles.EfficiencyTotal, 'value', efficiencyTotal);
set(handles.EfficiencyPrint, 'string', efficiencyPrint);
set(handles.EfficiencyPrint, 'value', efficiencyPrint);
set(handles.EfficiencyCuring, 'string', efficiencyCuring);
set(handles.EfficiencyCuring, 'value', efficiencyCuring);
set(handles.EfficiencySintering, 'string', efficiencySintering);
set(handles.EfficiencySintering, 'value', efficiencySintering);
set(handles.PreparationDegreeTotal, 'string', preparationDegreeTotal);
set(handles.PreparationDegreeTotal, 'value', preparationDegreeTotal);
set(handles.PreparationDegreePrint, 'string', preparationDegreePrint);
set(handles.PreparationDegreePrint, 'value', preparationDegreePrint);
set(handles.PreparationDegreeCuring, 'string', preparationDegreeCuring);
set(handles.PreparationDegreeCuring, 'value', preparationDegreeCuring);
set(handles.PreparationDegreeSintering, 'string', preparationDegreeSintering);
set(handles.PreparationDegreeSintering, 'value', preparationDegreeSintering);
set(handles.GreenPowderConsumptionEstimation, 'string', powderNeededActual); 
set(handles.GreenPowderConsumptionEstimation, 'value', powderNeededActual); 
set(handles.BinderConsumptionEstimation, 'string',totalBinderConsumption);
set(handles.BinderConsumptionEstimation, 'value',totalBinderConsumption);
set(handles.CleanerConsumptionEstimation, 'string',totalCleanerConsumption);
set(handles.CleanerConsumptionEstimation, 'value',totalCleanerConsumption);
set(handles.WasteGenerationEstimation, 'string',liquidWaste);
set(handles.WasteGenerationEstimation, 'value',liquidWaste);
set(handles.BinderEfficiencyEstimation, 'string', binderEfficiency);
set(handles.BinderEfficiencyEstimation, 'value', binderEfficiency);
set(handles.WasteRatioEstimation, 'string', wasteRatio);
set(handles.WasteRatioEstimation, 'value', wasteRatio);
set(handles.BinderRatioEstimation, 'string', binderRatio);
set(handles.BinderRatioEstimation, 'value', binderRatio);
set(handles.CleanerRatioEstimation, 'string', cleanerRatio);
set(handles.CleanerRatioEstimation, 'value', cleanerRatio);






% --- Executes on button press in ResetProfileButton.
function ResetProfileButton_Callback(hObject, eventdata, handles)
% hObject    handle to ResetProfileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('defaultSpreadDryingProfil.mat');
defaultSpreadDryingProfil=defaultprofile; %% load the initial Spread Drying profil
set(handles.PartVolume, 'string','');
set(handles.PartVolume, 'value', 0);
set(handles.CuringTemperatureEditor, 'value', 175);
set(handles.CuringHoldTimeEditor, 'value', 5);
set(handles.CuringTemperatureEditor, 'string', 175);
set(handles.CuringHoldTimeEditor, 'string', 5);
set(handles.SinteringProfileSelection, 'value',1);
set(handles.InitialDryingTimeEditor, 'value',30);
set(handles.InitialDryingTimeEditor, 'string',30);
set(handles.InitialSpreadSpeedEditor, 'value',1);
set(handles.InitialSpreadSpeedEditor, 'string','1.0');
set(handles.SpreadSpeedTable,'data',defaultSpreadDryingProfil);
set(handles.PrintingTimeEstimation, 'value',0);
set(handles.PrintingTimeEstimation, 'string','');
set(handles.CuringTimeEstimation, 'value',0);
set(handles.CuringTimeEstimation, 'string','');
set(handles.SinteringTimeEstimation, 'value',0);
set(handles.SinteringTimeEstimation, 'string','');
set(handles.ManualWorkTimeEstimation, 'value',0);
set(handles.ManualWorkTimeEstimation, 'string','');
set(handles.TotalTimeEstimationSeconds, 'value',0);
set(handles.TotalTimeEstimationSeconds, 'string','');
set(handles.TotalTimeEstimationHours, 'value',0);
set(handles.TotalTimeEstimationHours, 'string','');
set(handles.MainUsageTimeTotal, 'string', '');
set(handles.MainUsageTimeTotal, 'value', 0);
set(handles.MainUsageTimePrint, 'string', '');
set(handles.MainUsageTimePrint, 'value', 0);
set(handles.MainUsageTimeCuring, 'string', '');
set(handles.MainUsageTimeCuring, 'value', 0);
set(handles.MainUsageTimeSintering, 'string', '');
set(handles.MainUsageTimeSintering, 'value', 0);
set(handles.BusyTimeTotal, 'string', '');
set(handles.BusyTimeTotal, 'value', 0);
set(handles.BusyTimePrint, 'string', '');
set(handles.BusyTimePrint, 'value', 0);
set(handles.BusyTimeCuring, 'string', '');
set(handles.BusyTimeCuring, 'value', 0);
set(handles.BusyTimeSintering, 'string', '');
set(handles.BusyTimeSintering, 'value', 0);
set(handles.AvailabilityTotal, 'string', '');
set(handles.AvailabilityTotal, 'value', 0);
set(handles.AvailabilityPrint, 'string','');
set(handles.AvailabilityPrint, 'value', 0);
set(handles.AvailabilityCuring, 'string','');
set(handles.AvailabilityCuring, 'value',0);
set(handles.AvailabilitySintering, 'string', '');
set(handles.AvailabilitySintering, 'value', 0);
set(handles.EfficiencyTotal, 'string', '');
set(handles.EfficiencyTotal, 'value', 0);
set(handles.EfficiencyPrint, 'string', '');
set(handles.EfficiencyPrint, 'value', 0);
set(handles.EfficiencyCuring, 'string', '');
set(handles.EfficiencyCuring, 'value', 0);
set(handles.EfficiencySintering, 'string', '');
set(handles.EfficiencySintering, 'value', 0);
set(handles.PreparationDegreeTotal, 'string', '');
set(handles.PreparationDegreeTotal, 'value', 0);
set(handles.PreparationDegreePrint, 'string', '');
set(handles.PreparationDegreePrint, 'value', 0);
set(handles.PreparationDegreeCuring, 'string', '');
set(handles.PreparationDegreeCuring, 'value', 0);
set(handles.PreparationDegreeSintering, 'string', '');
set(handles.PreparationDegreeSintering, 'value', 0);
set(handles.GreenPowderConsumptionEstimation, 'string', ''); 
set(handles.GreenPowderConsumptionEstimation, 'value', 0); 
set(handles.BinderConsumptionEstimation, 'string','');
set(handles.BinderConsumptionEstimation, 'value',0);
set(handles.CleanerConsumptionEstimation, 'string','');
set(handles.CleanerConsumptionEstimation, 'value',0);
set(handles.WasteGenerationEstimation, 'string','');
set(handles.WasteGenerationEstimation, 'value',0);
set(handles.BinderEfficiencyEstimation, 'string', '');
set(handles.BinderEfficiencyEstimation, 'value', 0);
set(handles.WasteRatioEstimation, 'string', '');
set(handles.WasteRatioEstimation, 'value', 0);
set(handles.BinderRatioEstimation, 'string', '');
set(handles.BinderRatioEstimation, 'value', 0);
set(handles.CleanerRatioEstimation, 'string', '');
set(handles.CleanerRatioEstimation, 'value', 0);


function PrintingTimeEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to PrintingTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PrintingTimeEstimation as text
%        str2double(get(hObject,'String')) returns contents of PrintingTimeEstimation as a double


% --- Executes during object creation, after setting all properties.
function PrintingTimeEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PrintingTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CuringTimeEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to CuringTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CuringTimeEstimation as text
%        str2double(get(hObject,'String')) returns contents of CuringTimeEstimation as a double


% --- Executes during object creation, after setting all properties.
function CuringTimeEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CuringTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SinteringTimeEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to SinteringTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SinteringTimeEstimation as text
%        str2double(get(hObject,'String')) returns contents of SinteringTimeEstimation as a double


% --- Executes during object creation, after setting all properties.
function SinteringTimeEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SinteringTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ManualWorkTimeEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to ManualWorkTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ManualWorkTimeEstimation as text
%        str2double(get(hObject,'String')) returns contents of ManualWorkTimeEstimation as a double


% --- Executes during object creation, after setting all properties.
function ManualWorkTimeEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ManualWorkTimeEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalTimeEstimationSeconds_Callback(hObject, eventdata, handles)
% hObject    handle to TotalTimeEstimationSeconds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalTimeEstimationSeconds as text
%        str2double(get(hObject,'String')) returns contents of TotalTimeEstimationSeconds as a double


% --- Executes during object creation, after setting all properties.
function TotalTimeEstimationSeconds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TotalTimeEstimationSeconds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalTimeEstimationHours_Callback(hObject, eventdata, handles)
% hObject    handle to TotalTimeEstimationHours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalTimeEstimationHours as text
%        str2double(get(hObject,'String')) returns contents of TotalTimeEstimationHours as a double


% --- Executes during object creation, after setting all properties.
function TotalTimeEstimationHours_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TotalTimeEstimationHours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function SpreadSpeedTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SpreadSpeedTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in SpreadSpeedTable.
function SpreadSpeedTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to SpreadSpeedTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
defaultSpreadDryingProfil = get(hObject,'data');
guidata(hObject, handles);


% --- Executes when selected cell(s) is changed in SpreadSpeedTable.
function SpreadSpeedTable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to SpreadSpeedTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
defaultSpreadDryingProfil = get(hObject,'data');
% indices = eventdata.Indices;
% r = indices(:,1);
% c = indices(:,2);
% linear_index = sub2ind(size(defaultSpreadDryingProfil),r,c);
% selected_vals = defaultSpreadDryingProfil(linear_index);
% selection_sum = sum(sum(selected_vals));
guidata(hObject, handles);



% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






function BinderConsumptionEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to BinderConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BinderConsumptionEstimation as text
%        str2double(get(hObject,'String')) returns contents of BinderConsumptionEstimation as a double


% --- Executes during object creation, after setting all properties.
function BinderConsumptionEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BinderConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CleanerConsumptionEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to CleanerConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CleanerConsumptionEstimation as text
%        str2double(get(hObject,'String')) returns contents of CleanerConsumptionEstimation as a double


% --- Executes during object creation, after setting all properties.
function CleanerConsumptionEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CleanerConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GreenPowderConsumptionEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to GreenPowderConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GreenPowderConsumptionEstimation as text
%        str2double(get(hObject,'String')) returns contents of GreenPowderConsumptionEstimation as a double


% --- Executes during object creation, after setting all properties.
function GreenPowderConsumptionEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GreenPowderConsumptionEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AvailabilityPrint_Callback(hObject, eventdata, handles)
% hObject    handle to AvailabilityPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvailabilityPrint as text
%        str2double(get(hObject,'String')) returns contents of AvailabilityPrint as a double


% --- Executes during object creation, after setting all properties.
function AvailabilityPrint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvailabilityPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PreparationDegreePrint_Callback(hObject, eventdata, handles)
% hObject    handle to PreparationDegreePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PreparationDegreePrint as text
%        str2double(get(hObject,'String')) returns contents of PreparationDegreePrint as a double


% --- Executes during object creation, after setting all properties.
function PreparationDegreePrint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PreparationDegreePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EfficiencyPrint_Callback(hObject, eventdata, handles)
% hObject    handle to EfficiencyPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EfficiencyPrint as text
%        str2double(get(hObject,'String')) returns contents of EfficiencyPrint as a double


% --- Executes during object creation, after setting all properties.
function EfficiencyPrint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EfficiencyPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MainUsageTimePrint_Callback(hObject, eventdata, handles)
% hObject    handle to MainUsageTimePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MainUsageTimePrint as text
%        str2double(get(hObject,'String')) returns contents of MainUsageTimePrint as a double


% --- Executes during object creation, after setting all properties.
function MainUsageTimePrint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainUsageTimePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BusyTimePrint_Callback(hObject, eventdata, handles)
% hObject    handle to BusyTimePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BusyTimePrint as text
%        str2double(get(hObject,'String')) returns contents of BusyTimePrint as a double


% --- Executes during object creation, after setting all properties.
function BusyTimePrint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BusyTimePrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BinderEfficiencyEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to BinderEfficiencyEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BinderEfficiencyEstimation as text
%        str2double(get(hObject,'String')) returns contents of BinderEfficiencyEstimation as a double


% --- Executes during object creation, after setting all properties.
function BinderEfficiencyEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BinderEfficiencyEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WasteGenerationEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to WasteGenerationEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WasteGenerationEstimation as text
%        str2double(get(hObject,'String')) returns contents of WasteGenerationEstimation as a double


% --- Executes during object creation, after setting all properties.
function WasteGenerationEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasteGenerationEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MainUsageTimeCuring_Callback(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MainUsageTimeCuring as text
%        str2double(get(hObject,'String')) returns contents of MainUsageTimeCuring as a double


% --- Executes during object creation, after setting all properties.
function MainUsageTimeCuring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MainUsageTimeSintering_Callback(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MainUsageTimeSintering as text
%        str2double(get(hObject,'String')) returns contents of MainUsageTimeSintering as a double


% --- Executes during object creation, after setting all properties.
function MainUsageTimeSintering_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MainUsageTimeTotal_Callback(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MainUsageTimeTotal as text
%        str2double(get(hObject,'String')) returns contents of MainUsageTimeTotal as a double


% --- Executes during object creation, after setting all properties.
function MainUsageTimeTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainUsageTimeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BusyTimeCuring_Callback(hObject, eventdata, handles)
% hObject    handle to BusyTimeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BusyTimeCuring as text
%        str2double(get(hObject,'String')) returns contents of BusyTimeCuring as a double


% --- Executes during object creation, after setting all properties.
function BusyTimeCuring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BusyTimeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BusyTimeSintering_Callback(hObject, eventdata, handles)
% hObject    handle to BusyTimeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BusyTimeSintering as text
%        str2double(get(hObject,'String')) returns contents of BusyTimeSintering as a double


% --- Executes during object creation, after setting all properties.
function BusyTimeSintering_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BusyTimeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BusyTimeTotal_Callback(hObject, eventdata, handles)
% hObject    handle to BusyTimeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BusyTimeTotal as text
%        str2double(get(hObject,'String')) returns contents of BusyTimeTotal as a double


% --- Executes during object creation, after setting all properties.
function BusyTimeTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BusyTimeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AvailabilityCuring_Callback(hObject, eventdata, handles)
% hObject    handle to AvailabilityCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvailabilityCuring as text
%        str2double(get(hObject,'String')) returns contents of AvailabilityCuring as a double


% --- Executes during object creation, after setting all properties.
function AvailabilityCuring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvailabilityCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AvailabilitySintering_Callback(hObject, eventdata, handles)
% hObject    handle to AvailabilitySintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvailabilitySintering as text
%        str2double(get(hObject,'String')) returns contents of AvailabilitySintering as a double


% --- Executes during object creation, after setting all properties.
function AvailabilitySintering_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvailabilitySintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AvailabilityTotal_Callback(hObject, eventdata, handles)
% hObject    handle to AvailabilityTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvailabilityTotal as text
%        str2double(get(hObject,'String')) returns contents of AvailabilityTotal as a double


% --- Executes during object creation, after setting all properties.
function AvailabilityTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvailabilityTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EfficiencyCuring_Callback(hObject, eventdata, handles)
% hObject    handle to EfficiencyCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EfficiencyCuring as text
%        str2double(get(hObject,'String')) returns contents of EfficiencyCuring as a double


% --- Executes during object creation, after setting all properties.
function EfficiencyCuring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EfficiencyCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EfficiencySintering_Callback(hObject, eventdata, handles)
% hObject    handle to EfficiencySintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EfficiencySintering as text
%        str2double(get(hObject,'String')) returns contents of EfficiencySintering as a double


% --- Executes during object creation, after setting all properties.
function EfficiencySintering_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EfficiencySintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EfficiencyTotal_Callback(hObject, eventdata, handles)
% hObject    handle to EfficiencyTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EfficiencyTotal as text
%        str2double(get(hObject,'String')) returns contents of EfficiencyTotal as a double


% --- Executes during object creation, after setting all properties.
function EfficiencyTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EfficiencyTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PreparationDegreeCuring_Callback(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PreparationDegreeCuring as text
%        str2double(get(hObject,'String')) returns contents of PreparationDegreeCuring as a double


% --- Executes during object creation, after setting all properties.
function PreparationDegreeCuring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeCuring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PreparationDegreeSintering_Callback(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PreparationDegreeSintering as text
%        str2double(get(hObject,'String')) returns contents of PreparationDegreeSintering as a double


% --- Executes during object creation, after setting all properties.
function PreparationDegreeSintering_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeSintering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PreparationDegreeTotal_Callback(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PreparationDegreeTotal as text
%        str2double(get(hObject,'String')) returns contents of PreparationDegreeTotal as a double


% --- Executes during object creation, after setting all properties.
function PreparationDegreeTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PreparationDegreeTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LifeCycleAssessmentButton.
function LifeCycleAssessmentButton_Callback(hObject, eventdata, handles)
% hObject    handle to LifeCycleAssessmentButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function PartVolume_Callback(hObject, eventdata, handles)
% hObject    handle to PartVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PartVolume as text
%        str2double(get(hObject,'String')) returns contents of PartVolume as a double


% --- Executes during object creation, after setting all properties.
function PartVolume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PartVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WasteRatioEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to WasteRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WasteRatioEstimation as text
%        str2double(get(hObject,'String')) returns contents of WasteRatioEstimation as a double


% --- Executes during object creation, after setting all properties.
function WasteRatioEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasteRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BinderRatioEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to BinderRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BinderRatioEstimation as text
%        str2double(get(hObject,'String')) returns contents of BinderRatioEstimation as a double


% --- Executes during object creation, after setting all properties.
function BinderRatioEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BinderRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CleanerRatioEstimation_Callback(hObject, eventdata, handles)
% hObject    handle to CleanerRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CleanerRatioEstimation as text
%        str2double(get(hObject,'String')) returns contents of CleanerRatioEstimation as a double


% --- Executes during object creation, after setting all properties.
function CleanerRatioEstimation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CleanerRatioEstimation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
