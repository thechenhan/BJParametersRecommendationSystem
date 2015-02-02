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

% Last Modified by GUIDE v2.5 27-Jan-2015 20:41:51

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
h = handles.figure1;
newIcon = javax.swing.ImageIcon('ICON_LOGO.jpg')
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标
% Choose default command line output for test_filereader
handles.output = hObject;

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ProcessVariables.Layer_Thickness = str2double(get(handles.Layer_Thickness,'String'));
% ProcessVariables.Drying_Time = str2double(get(handles.Drying_Time,'String'));
% ProcessVariables.Drying_Power = str2double(get(handles.Drying_Power,'String'));
% ProcessVariables.Spreading_Speed = str2double(get(handles.Spreading_Speed,'String'));
% ProcessVariables.Printing_Saturation = str2double(get(handles.Printing_Saturation,'String'));
% ProcessVariables.Powder_Recycle_Ratio = str2double(get(handles.Powder_Recycle_Ratio,'String'));
% ProcessVariables.Rapid_Traversing_Speed = str2double(get(handles.Rapid_Traversing_Speed,'String'));
% assignin('base','ProcessVariables',ProcessVariables);
Layer_Thickness=str2double(get(handles.Layer_Thickness,'String'));
Spreading_Speed=str2double(get(handles.Spreading_Speed,'String'));
Drying_Time=str2double(get(handles.Drying_Time,'String'));
Clean_Frequency=str2double(get(handles.Clean_Frequency,'String'));
Powder_Recycle_Ratio=str2double(get(handles.Powder_Recycle_Ratio,'String'))/100;
Printing_Saturation=str2double(get(handles.Printing_Saturation,'String'))/100;
Rapid_Traversing_Speed=str2double(get(handles.Rapid_Traversing_Speed,'String'));

intersectlayer=evalin('base','intersectlayer');
layerNum=size(intersectlayer,2);

OperationPower=evalin('base','Power');

for i=1:layerNum
    [la(i),xlimit{i},ylimit{i}]=slicebar(intersectlayer{i});
end

Time=0;
Power=0;
TT=0;
% EOP=0;
% EOS=0;
% EOD=0;
TE=0;
ST=0;
DT=0;
SD=0;
PT=0;

for i=1:layerNum
    SD=xlimit{i}(2)-xlimit{i}(1);
    SD=SD+10;
%     if i>=1 && i<10 
%         ST=2+(SD)/1+(120-SD)/25; 
%     end
%     if i>=11 && i<15 
%         ST=2+(SD)/3+(120-SD)/25; 
%     end
%     if i>=15 && i<20 
%         ST=2+(SD)/5+(120-SD)/25; 
%     end
%     if i>=20 && i<25 
%         ST=2+(SD)/10+(120-SD)/25;
%     end
%     if i>=25 && i<35 
%         ST=2+(SD)/15+(120-SD)/25; 
%     end
%     if i>=35
%         ST=2+(SD)/20+(120-SD)/25;  
%     end
    ST=2+(SD)/Spreading_Speed+(120-SD)/Rapid_Traversing_Speed;
    [Time,Power,TT]=addData(Time,Power,OperationPower.Spreading,ST,TT);
    TE=TE+OperationPower.Spreading*ST;
    
    PT=0.09*ylimit{i}(2)+26.4670+2.5;
    [Time,Power,TT]=addData(Time,Power,OperationPower.Printing,PT,TT);
    TE=TE+OperationPower.Printing*PT;
    
    
%     if i>=1 && i<10 
%         DT=50; 
%     end
%     if i>=10 && i<20 
%         DT=40; 
%     end
%     if i>=20 
%         DT=40; 
%     end
    [Time,Power,TT]=addData(Time,Power,OperationPower.Drying,Drying_Time,TT);
    TE=TE+OperationPower.Printing*Drying_Time;

end
SimResult.Time=Time;
SimResult.Power=Power;
SimResult.TT=TT;
SimResult.TE=TE;
Volume=sum(la)*Layer_Thickness/1000;
Weight=Volume*4.0714;
SimResult.Powder=342-(342-Weight)*Powder_Recycle_Ratio;
SimResult.Cleaner=layerNum*Clean_Frequency*6.24;
SimResult.Binder=layerNum*Clean_Frequency*7.158+Volume*0.4730*Printing_Saturation;


assignin('base','SimResult',SimResult);
run('Simulation_Result.m');  
handles=guihandles;
% axes(handles.Time_Power_Curve);
% plotwithprocess(SimResult.Time,SimResult.Power);
set(handles.Total_Energy,'String','a');

% % Layer_Thickness = str2double(get(handles.Layer_Thickness,'String'));
% % assignin('base','Layer_Thickness',Layer_Thickness);
% % Drying_Time = str2double(get(handles.Drying_Time,'String'));
% % assignin('base','Drying_Time',Drying_Time);
% % Drying_Power = str2double(get(handles.Drying_Power,'String'));
% % assignin('base','Drying_Power',Drying_Power);
% % Spreading_Speed = str2double(get(handles.Spreading_Speed,'String'));
% % assignin('base','Spreading_Speed',Spreading_Speed);
% % Printing_Saturation = str2double(get(handles.Printing_Saturation,'String'));
% % assignin('base','Printing_Saturation',Printing_Saturation);
% % Powder_Recycle_Ratio = str2double(get(handles.Powder_Recycle_Ratio,'String'));
% % assignin('base','Powder_Recycle_Ratio',Powder_Recycle_Ratio);



function Rapid_Traversing_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to Rapid_Traversing_Speed (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rapid_Traversing_Speed as text
%        str2double(get(hObject,'String')) returns contents of Rapid_Traversing_Speed as drying double


% --- Executes during object creation, after setting all properties.
function Rapid_Traversing_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rapid_Traversing_Speed (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Layer_List.
function Layer_List_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_List (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
layer=get(hObject,'Value');
intersectlayer=evalin('base','intersectlayer');
xLimits=evalin('base','xLimits');
a=xLimits(1,2)-xLimits(1,1);
xLimits(1,1)=xLimits(1,1)-a*0.1;
xLimits(1,2)=xLimits(1,2)+a*0.1;
yLimits=evalin('base','yLimits');
a=yLimits(1,2)-yLimits(1,1);
yLimits(1,1)=yLimits(1,1)-a*0.1;
yLimits(1,2)=yLimits(1,2)+a*0.1;
currIntersect=intersectlayer{layer};
axes(handles.Layer_View);
cla(handles.Layer_View);
    hold all
    axis equal
    xlim(xLimits)
    ylim(yLimits)
    for idxObj = 1: numel(currIntersect)
        switch size(currIntersect{idxObj}, 1)
            case 1
                plot(currIntersect{idxObj}(:,1), currIntersect{idxObj}(:,2), '+');
            case 2
                plot(currIntersect{idxObj}(:,1), currIntersect{idxObj}(:,2), '-');
            case 3
                fill(currIntersect{idxObj}(:,1), currIntersect{idxObj}(:,2), rand(1,3));
        end
    end
    drawnow

% Hints: contents = cellstr(get(hObject,'String')) returns Layer_List contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Layer_List


% --- Executes during object creation, after setting all properties.
function Layer_List_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_List (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have drying white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% slice the STL file
LT=get(handles.Layer_Thickness,'String');
LT=str2double(LT)/1000;
intersectlayer=slicelayer(get(handles.file_path,'String'),LT);

% Delete Void Cells of the layer information
intersectlayer=deletevoidcell(intersectlayer);
assignin('base','intersectlayer',intersectlayer);

% Fill the Layer_List
% intersectlayer=evalin('base','intersectlayer');
length=size(intersectlayer,2);
for i=1:length
    layerlist{i,1}=i;
end
set(handles.Layer_List,'String',layerlist);



function File_Path_Power_Callback(hObject, eventdata, handles)
% hObject    handle to File_Path_Power (see GCBO)
% eventdata  reserved - to be defined in drying future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of File_Path_Power as text
%        str2double(get(hObject,'String')) returns contents of File_Path_Power as drying double


% --- Executes during object creation, after setting all properties.
function File_Path_Power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to File_Path_Power (see GCBO)
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
    set(handles.Layer_Thickness, 'string',  parameterDatabase(1, minTimePosition));
    set(handles.Printing_Saturation, 'string',  parameterDatabase(2, minTimePosition));
    set(handles.Heater_Power_Ratio, 'string',  parameterDatabase(3, minTimePosition));
    set(handles.Drying_Time, 'string',  parameterDatabase(4, minTimePosition));
    set(handles.Surface_Roughness, 'string',  predictRa(1, minTimePosition));
    set(handles.Shrinkage_Y, 'string',  PredictValueShrinkageY(1, minTimePosition)*100);
    set(handles.Shrinkage_Z, 'string',  PredictShrinkageZValue(1, minTimePosition)*100);
    set(handles.Optimal_Printing_Time, 'string', minTimeValue);
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
