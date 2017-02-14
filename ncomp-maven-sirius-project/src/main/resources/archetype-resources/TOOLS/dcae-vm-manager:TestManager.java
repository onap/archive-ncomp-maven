
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

import java.io.IOException;

import org.json.JSONObject;

import NCOMPBASE.SSSS.manager.AAAAManager;
import NCOMPBASE.SSSS.manager.ManagerFactory;
import NCOMPBASE.SSSS.servers.manager.DcaeManagerFactory;
import NCOMPBASE.SSSS.servers.service.DcaeServiceFactory;
import NCOMPBASE.SSSS.service.ContrailController;
import NCOMPBASE.SSSS.service.ServiceFactory;
import org.openecomp.ncomp.sirius.manager.ISiriusServer;
import org.openecomp.ncomp.sirius.manager.ManagementServer;

// Testing manager from inside standard Java Process
// Manager process and Test Process in the same Java JVM in the same thread
public class TestManager implements ISiriusServer {

	public static void main(String[] args) throws IOException {
		TestManager t = new TestManager();
		t.test();
	}

	private ManagementServer server;

	public void test() throws IOException {
		server = new ManagementServer(null, null, null, "manager.properties");
		ManagerFactory f1 = new DcaeManagerFactory(this);
		server.addFactory(f1);
		AAAAManager m = f1.createAAAAManager();
		server.setObject(m);
		server.start();
		// Start interacting with the manager.
		ServiceFactory f2 = new DcaeServiceFactory(this);
		ContrailController x = f2.createContrailController();
		x.setContrailIp("1.2.3.4");
		x.setName("local1");
		m.getLocalControllers().add(x);
		JSONObject j = ManagementServer.ecore2json(m, 100, null, true);
		System.err.println(j.toString(2));
		x.setContrailIp("1.2.3.5");
		j = ManagementServer.ecore2json(m, 100, null, true);
		System.err.println(j.toString(2));
		m.restart();
		m.hello_manager("hi");
	}

	@Override
	public ManagementServer getServer() {
		return server;
	}

}
