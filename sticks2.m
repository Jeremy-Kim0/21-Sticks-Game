function varargout = sticks2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sticks2_OpeningFcn, ...
                   'gui_OutputFcn',  @sticks2_OutputFcn, ...
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

function sticks2_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for sticks2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sticks2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%text boxes in turn log%
set(handles.edit3,'visible','off')
set(handles.text5,'visible','off')
set(handles.edit8, 'visible', 'off')
set(handles.edit9, 'visible', 'off')
set(handles.edit10, 'visible', 'off')
set(handles.edit11, 'visible', 'off')
set(handles.edit12, 'visible', 'off')
set(handles.edit13, 'visible', 'off')
set(handles.edit14, 'visible', 'off')
set(handles.edit15, 'visible', 'off')
set(handles.edit16, 'visible', 'off')
set(handles.edit17, 'visible', 'off')
set(handles.edit18, 'visible', 'off')
set(handles.edit19, 'visible', 'off')
set(handles.edit20, 'visible', 'off')
set(handles.edit21, 'visible', 'off')
set(handles.text6, 'visible', 'off')

win=findStrat(20);%win is winning strategy array%
handles.text6.String= win;%stored in textbox%

function varargout = sticks2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles) %to take one stick%

counter=str2double(handles.text5.String);%counter to keep track of turn and text box index%
handles.text5.String=num2str(counter+1);%increments counter%
turnBoxString=num2str(counter+8);%number of text box for player turn%
turnBoxString2=num2str(counter+9);%number of text box for computer turn%
handles.text5.String=num2str(counter+2);
turnBoxNum=strcat("edit", turnBoxString);%handle of textbox in String format%
turnBoxNum2=strcat("edit", turnBoxString2);%handle of textbox in String format%
turnBoxChar=convertStringsToChars(turnBoxNum);%handle of textbox in char format%
turnBoxChar2=convertStringsToChars(turnBoxNum2);%handle of textbox in char format%
num=str2double(handles.edit1.String);%current number of sticks%

if num-1<=0% for end of game%
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(0);
        handles.(turnBoxChar).String=("Player Took 1 Stick");%turnBoxChar is handle name%
        set(handles.(turnBoxChar), 'visible', 'on');
        handles.edit3.String="Computer Won";
        set(handles.edit3,'visible','on')
        set(handles.pushbutton2,'enable','off')%turned off for end of game%
        set(handles.pushbutton1,'enable','off')%turned off for end of game%
        set(handles.pushbutton3,'enable','off')%turned off for end of game%
else
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(num-1);%sticks updated for player turn%
        handles.(turnBoxChar).String=("Player Took 1 Stick");%turn log textbox%
        set(handles.(turnBoxChar), 'visible', 'on');
        pause(1)
        win=handles.text6.String;%winning array%
        num=str2double(handles.edit1.String);
        compIndex= win(num-1);%index of winning array%
        compSticks=str2double(compIndex);%number of sticks computer will take%
        compString=num2str(compSticks);%number of sticks to take in string format%
        handles.edit1.String= num2str(num-1-compSticks);%updates number of sticks for computer turn%
        handles.(turnBoxChar2).String= strcat("Computer took ",compString, " sticks");%text for text box in turn log&
        set(handles.(turnBoxChar2), 'visible', 'on');

end


function pushbutton3_Callback(hObject, eventdata, handles)
counter=str2double(handles.text5.String);%counter to keep track of turn and text box index%
handles.text5.String=num2str(counter+1);%increments counter%
turnBoxString=num2str(counter+8);%number of text box for player turn%
turnBoxString2=num2str(counter+9);%number of text box for computer turn%
handles.text5.String=num2str(counter+2);
turnBoxNum=strcat("edit", turnBoxString);%handle of textbox in String format%
turnBoxNum2=strcat("edit", turnBoxString2);%handle of textbox in String format%
turnBoxChar=convertStringsToChars(turnBoxNum);%handle of textbox in char format%
turnBoxChar2=convertStringsToChars(turnBoxNum2);%handle of textbox in char format%
num=str2double(handles.edit1.String);%current number of sticks%

if num-3<=0% for end of game%
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(0);
        handles.(turnBoxChar).String=("Player Took 3 Sticks");%turnBoxChar is handle name%
        set(handles.(turnBoxChar), 'visible', 'on');
        handles.edit3.String="Computer Won";
        set(handles.edit3,'visible','on')
        set(handles.pushbutton2,'enable','off')%turned off for end of game%
        set(handles.pushbutton1,'enable','off')%turned off for end of game%
        set(handles.pushbutton3,'enable','off')%turned off for end of game%
else
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(num-3);%sticks updated for player turn%
        handles.(turnBoxChar).String=("Player Took 1 Stick");%turn log textbox%
        set(handles.(turnBoxChar), 'visible', 'on');
        pause(1)
        win=handles.text6.String;%winning array%
        num=str2double(handles.edit1.String);
        compIndex= win(num-3);%index of winning array%
        compSticks=str2double(compIndex);%number of sticks computer will take%
        compString=num2str(compSticks);%number of sticks to take in string format%
        handles.edit1.String= num2str(num-3-compSticks);%updates number of sticks for computer turn%
        handles.(turnBoxChar2).String= strcat("Computer took ",compString, " sticks");%text for text box in turn log&
        set(handles.(turnBoxChar2), 'visible', 'on');

end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
counter=str2double(handles.text5.String);%counter to keep track of turn and text box index%
handles.text5.String=num2str(counter+1);%increments counter%
turnBoxString=num2str(counter+8);%number of text box for player turn%
turnBoxString2=num2str(counter+9);%number of text box for computer turn%
handles.text5.String=num2str(counter+2);
turnBoxNum=strcat("edit", turnBoxString);%handle of textbox in String format%
turnBoxNum2=strcat("edit", turnBoxString2);%handle of textbox in String format%
turnBoxChar=convertStringsToChars(turnBoxNum);%handle of textbox in char format%
turnBoxChar2=convertStringsToChars(turnBoxNum2);%handle of textbox in char format%
num=str2double(handles.edit1.String);%current number of sticks%

if num-2<=0% for end of game%
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(0);
        handles.(turnBoxChar).String=("Player Took 2 Sticks");%turnBoxChar is handle name%
        set(handles.(turnBoxChar), 'visible', 'on');
        handles.edit3.String="Computer Won";
        set(handles.edit3,'visible','on')
        set(handles.pushbutton2,'enable','off')%turned off for end of game%
        set(handles.pushbutton1,'enable','off')%turned off for end of game%
        set(handles.pushbutton3,'enable','off')%turned off for end of game%
else
        num=str2double(handles.edit1.String);%current number of sticks%
        handles.edit1.String= num2str(num-2);%sticks updated for player turn%
        handles.(turnBoxChar).String=("Player Took 2 Sticks");%turn log textbox for player%
        set(handles.(turnBoxChar), 'visible', 'on');
        pause(1)
        win=handles.text6.String;%winning array%
        num=str2double(handles.edit1.String);
        compIndex= win(num-2);%index of winning array%
        compSticks=str2double(compIndex);%number of sticks computer will take%
        compString=num2str(compSticks);%number of sticks to take in string format%
        handles.edit1.String= num2str(num-2-compSticks);%updates number of sticks for computer turn%
        handles.(turnBoxChar2).String= strcat("Computer took ",compString, " sticks");%text for text box in turn log&
        set(handles.(turnBoxChar2), 'visible', 'on');

end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton6_Callback(hObject, eventdata, handles)%Start Game pushbutton%

set(handles.pushbutton6,'visible','off');
pause(1)
win=handles.text6.String;% winning array%
turn1= win(20);%number of sticks computer will take on first turn%
turn1=str2num(turn1);
turn1String=num2str(turn1);
remaining=20-turn1;%sticks remaining after computer turn%
handles.edit1.String= num2str(remaining);% updates number of sticks%
handles.edit8.String=strcat("Computer took ", turn1String, " sticks");
set(handles.edit8, 'visible', 'on');

function edit4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
