
/*-
 * ============LICENSE_START==========================================
 * OPENECOMP - DCAE
 * ===================================================================
 * Copyright (c) 2017 AT&T Intellectual Property. All rights reserved.
 * ===================================================================
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0 
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============LICENSE_END============================================
 */
	
package NCOMPBASE.SSSS.manager.tools;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.openecomp.dcae.controller.service.vm.VmFactory;
import org.openecomp.ncomp.sirius.manager.controllermodel.ControllerModel;
import org.openecomp.ncomp.sirius.manager.controllermodel.ControllermodelFactory;
import org.openecomp.ncomp.sirius.manager.generator.ControllerGenerator;
import org.openecomp.ncomp.gwt.siriusportal.model.*;
import org.openecomp.ncomp.sirius.manager.server.ServerPackage;
import org.openecomp.dcae.controller.service.vmmanager.VmmanagerFactory;

import NCOMPBASE.SSSS.service.ServiceFactory;
import NCOMPBASE.SSSS.manager.ManagerFactory;

public class Generator {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		@SuppressWarnings("unused")
		ServerPackage f = ServerPackage.eINSTANCE;
		genManager();
		genService();
	}

	public static void genManager() {
		EObject o = ManagerFactory.eINSTANCE.createAAAAManager();
		EPackage p = o.eClass().getEPackage();
		String dir = p.getNsURI().replaceAll(p.getNsPrefix()+'$',"") + "servers." + p.getNsPrefix();
		dir = "src/main/sirius-gen/" + dir.replace('.', '/');
		ControllerModel m = ControllermodelFactory.eINSTANCE.createControllerModel();
		m.setTemplateDirectory("../../dcae-org.openecomp.ncomp.sirius.manager/ncomp-sirius-manager-generator/src/main/templates");
		m.setPrefix("Dcae");
		m.setPluginName(p.getNsURI());
		m.setName("AAAAManager");
		m.setTitle("AAAAManager");
		ControllerGenerator g = new ControllerGenerator(o, m);
		g.setEnableIRequestHandler(false);
		g.setEnableISiriusPlugin(false);
		g.addFactory(ServiceFactory.eINSTANCE);
		EObject gui = ModelFactory.eINSTANCE.createGuiClientApi();
		g.addObject("gui", gui, m);
		g.setProvider(VmmanagerFactory.eINSTANCE.createVirtualMachineManager(), "Dcae");
		g.generate(dir);
		g.generateScripts("src/main/server-gen/bin", "PPPP-QQQQ");
	}

	public static void genService() {
		EObject o = ServiceFactory.eINSTANCE.createAAAAService();
		EPackage p = o.eClass().getEPackage();
		String dir = p.getNsURI().replaceAll(p.getNsPrefix()+"$", "") + "servers." + p.getNsPrefix();
		dir = "src/main/sirius-gen/" + dir.replace('.', '/');
		ControllerModel m = ControllermodelFactory.eINSTANCE.createControllerModel();
		m.setTemplateDirectory("../../dcae-org.openecomp.ncomp.sirius.manager/ncomp-sirius-manager-generator/src/main/templates");
		m.setPrefix("Dcae");
		m.setPluginName(p.getNsURI());
		m.setName("AAAAService");
		m.setTitle("AAAAService");
		ControllerGenerator g = new ControllerGenerator(o, m);
		g.setEnableIRequestHandler(false);
		g.setEnableISiriusPlugin(true);
		g.addFactory(ServiceFactory.eINSTANCE);
		g.setProvider(VmFactory.eINSTANCE.createVirtualMachineService(), "Dcae");
		g.generate(dir);
	}

}
