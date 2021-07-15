classdef HappinessGauge 

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        Slider               matlab.ui.control.Slider
        SliderLabel          matlab.ui.control.Label
        HappinessGauge1       matlab.ui.control.SemicircularGauge
        HappinessGaugeLabel  matlab.ui.control.Label
        Image                matlab.ui.control.Image
    end
        
    methods (Access = private)
    end
   % App creation and deletion
    methods (Access = public)
        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';


            % Create HappinessGaugeLabel
            app.HappinessGaugeLabel = uilabel(app.UIFigure);
            app.HappinessGaugeLabel.HorizontalAlignment = 'center';
            app.HappinessGaugeLabel.Position = [381 168 63 22];
            app.HappinessGaugeLabel.Text = 'Happiness';

            % Create HappinessGauge
            app.HappinessGauge = uigauge(app.UIFigure, 'semicircular');
            app.HappinessGauge.Limits = [0 10];
            app.HappinessGauge.Position = [273 205 280 151];
                        % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
            
            obj.HappinessGauge.value = mood;
%or
app.HappinessGauge.Value = mood;

        end



        % Construct app
        function app = happinessmeter

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end