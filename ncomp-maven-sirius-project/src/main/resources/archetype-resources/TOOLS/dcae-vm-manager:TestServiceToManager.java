
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

import NCOMPBASE.SSSS.servers.service.DcaeServiceFactory;
import NCOMPBASE.SSSS.service.AAAAService;
import NCOMPBASE.SSSS.service.AAAAServiceInstance;
import NCOMPBASE.SSSS.service.ServiceFactory;
import org.openecomp.dcae.controller.service.vm.PhysicalMachine;
import org.openecomp.dcae.controller.service.vm.VmFactory;

// Testing service from inside standard Java Process
// This connects to a manager server 
public class TestServiceToManager {

	public static void main(String[] args) {
		ServiceFactory f = new DcaeServiceFactory(null);
		AAAAService s = f.createAAAAService();
		AAAAServiceInstance i = f.createAAAAServiceInstance();
		s.getInstances().add(i);
		i.setName("myInstance");
		PhysicalMachine p = VmFactory.eINSTANCE.createPhysicalMachine();
		i.getServers().add(p);
		// Setup connection parameters.
		p.setPublicIp("localhost");
		p.setManagerPortNumber(9922);
		s.pollManagerConfiguration("myInstance");
		// TODO more examples
	}

}
