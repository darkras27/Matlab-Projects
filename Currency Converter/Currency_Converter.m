function Currency_Converter_final
%building figure
h.fig = set(figure, 'Name', 'Currency Converter');
%building popup menu
h.menu = uicontrol('Style', 'popup', 'String',...
  'USD|EUR|GBP|Ruble', 'Position',[180, 200, 200, 200], 'FontSize', 13);
%building edit text field for the input
h.input = uicontrol('Style', 'edit', 'Position',[150, 250, 100, 40], 'FontSize', 13, 'String', '0');
set(h.input, 'callBack',{@checkText, h})
%building push button
h.pushButton = uicontrol('style', 'pushbutton', 'Position', [230,190, 100,40],...
    'string', 'Convert');
set(h.pushButton, 'callBack', {@convertButton,h})
%building slider
h.text = uicontrol('Style', 'text', 'String', 'Grade for the PROJECT',...   //upper text
    'Position', [100 120 350 15] );
h.text = uicontrol('Style', 'text', 'String', 'Max',...     //text from the right
    'Position', [100 80 600 15] );
h.text = uicontrol('Style', 'text', 'String', 'Min',...     //text from the left
    'Position', [100 80 120 15] );
h.slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 100, 'Value', 100,  'Position', [180 60 200 50]);
set(h.slider, 'callBack', {@sliderVal, h})
%text above output box
h.output = uicontrol('Style', 'text', 'Position',[300, 280, 70, 50],...
    'FontSize', 13, 'String', 'ILS');
%making the figure unresizable
set(gcf, 'Resize', 'off')

%checking that the input is numeric
function h = checkText(hObject, eventdata, h)
input = get(h.input,'String');
if isempty(str2num(input))
    set(h.input,'string','0');
    warndlg('Input must be numerical');
end
end

%callBack for the pushButton
function h = convertButton(hObject, eventdata, h)
input = get(h.input,'String')
val = get(h.menu, 'Value')
if val == 1
 output = str2num(input).*3.4
elseif val == 2
 output = str2num(input).*4.2
elseif val == 3
 output = str2num(input).*7.6
elseif val == 4
 output = str2num(input).*0.06
end
%output not editable text
 h.output = uicontrol('Style', 'text', 'Position',[300, 235, 70, 50],...
    'FontSize', 13, 'String', num2str(output));
end

%callBack for the slider
function h = sliderVal(hObject, eventdata, h)
My_grade = get(h.slider,'Value');
d = dialog('Position',[400 400 250 150],'Name','Final Grade');
uicontrol('Parent',d,'Style','text','FontSize', 30,...
               'Position',[20 80 210 50],...
               'String','The grade is: %d', 'String', num2str(My_grade));
end
end


