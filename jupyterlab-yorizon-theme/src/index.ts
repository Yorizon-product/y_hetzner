import {
  JupyterFrontEnd,
  JupyterFrontEndPlugin
} from '@jupyterlab/application';
import { IThemeManager } from '@jupyterlab/apputils';

const plugin: JupyterFrontEndPlugin<void> = {
  id: 'jupyterlab-yorizon-theme:plugin',
  description: 'Yorizon dark theme for JupyterLab',
  autoStart: true,
  requires: [IThemeManager],
  activate: (app: JupyterFrontEnd, manager: IThemeManager) => {
    const style = 'jupyterlab-yorizon-theme/index.css';
    manager.register({
      name: 'Yorizon Dark',
      isLight: false,
      themeScrollbars: true,
      load: () => manager.loadCSS(style),
      unload: () => Promise.resolve(undefined)
    });
  }
};

export default plugin;
