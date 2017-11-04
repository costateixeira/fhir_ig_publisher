<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="pref" select="pref"/>
	<xsl:template match="/">
		<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
			<div id="segment-content" class="segment">
				<!-- segment-content -->
				<div class="container">
					<!-- container -->
					<div class="row">
						<div class="inner-wrapper">
							<!-- CONTENT CONTENT -->
							<div class="col-12">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#sequence">Sequence</a></li>
									<li><a data-toggle="tab" href="#details">Details</a></li>
									<li><a data-toggle="tab" href="#resources">Resources</a></li>
								</ul>
								<div class="tab-content">
									<div id="sequence" class="tab-pane fade in active">
										<h3><a name="description"/>Description</h3>
										<p><xsl:value-of select="/ExampleScenario/description/@value"/></p>
										<h4><a name="preconditions"/>Pre-Conditions</h4>
										<p><xsl:value-of select="/ExampleScenario/process/preConditions/@value"/></p>
										<h4><a name="postconditions"/>Post Conditions</h4>
										<p><xsl:value-of select="/ExampleScenario/process/postConditions/@value"/></p>
										<br/>
										<img alt="Interaction diagram showing flow" src="{$pref}diagram.png" usemap="#diagram_map"/>
										<xsl:value-of select="unparsed-text('./diagram.cmapx')" disable-output-escaping="yes"/>
									</div>


									<div id="details" class="tab-pane fade">
										<h2><a name="details"/>Details</h2>
										<div>
											<table class="cols">
												<tr>
													<td>Publisher: (link?) <xsl:value-of select="/ExampleScenario/publisher/@value"/>
													</td>
													<td>
														<a href="versions.html#maturity">Status</a>: <xsl:value-of select="/ExampleScenario/status/@value"/>
													</td>
													<td>
														<a href="versions.html#maturity">Experimental</a>: <xsl:value-of select="/ExampleScenario/experimental/@value"/>
													</td>
													<td>
														<a href="versions.html#maturity">Copyright</a>: <xsl:value-of select="/ExampleScenario/copyright/@value"/>
													</td>
												</tr>
											</table>
											<table  class="cols">
												<tr>
													<td>
														<a href="versions.html#maturity">Purpose</a>: <xsl:value-of select="/ExampleScenario/purpose/@value"/>
													</td>
												</tr>
											</table>
											<p></p>
											<p></p>
											
										</div>
										<div>
											<h3><a name="Actors"/>Actors</h3>
											<table class="grid">
												<tbody>
													<tr>
														<th>Name</th>
														<th>Type</th>
														<th>Description</th>
													</tr>
													<xsl:apply-templates select="/ExampleScenario/actor"/>
												</tbody>
											</table>
											<p></p>
											<p></p>
										</div>
										<div>
											<h3><a name="flow"/>Process Flow - <xsl:value-of select="/ExampleScenario/process/description/@value"/></h3>
											<xsl:apply-templates select="/ExampleScenario/process"/>
													

										</div>
									</div>
									<div id="resources" class="tab-pane fade">
										<h3>Resources</h3>
										<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
										<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
										
									</div>
								</div>


								<!-- /row -->
								<!--									
								</div>
-->

							</div>
							<!-- /container -->
						</div>
					</div>

				</div>
			</div>

		</div>


	</xsl:template>




	<xsl:template match="actor">
		<tr>
			<td>
				<b>
					<xsl:value-of select="name/@value"/>
				</b>
			</td>
			<td>
				<xsl:value-of select="type/@value"/>
			</td>
			<td>
				<xsl:value-of select="description/@value"/>
			</td>
		</tr>
	</xsl:template>	


	<xsl:template match="/ExampleScenario/process">
		<!--		<h3><xsl:value-of select="title/@value"/></h3> <br/>  -->
		
			<div class="container">
				<div class="row">
						<div class="menu">
							<div class="accordion">
								<!-- Áreas -->
								<div class="accordion-group">
									<div class="accordion-heading area">
									Main Flow
									</div>
									<!-- /Área -->
									start finish
									<div class="accordion-body">
										<div class="accordion-inner">
											<div class="accordion">
											
		<xsl:apply-templates select="step"/>
											
											
											
											</div>
										</div>					
									</div>
								</div><!-- /accordion -->
							</div> 
						</div>
				</div>					
			</div>													

		
	</xsl:template>	

	<xsl:template match="process"> 
		<xsl:value-of select="title/@value"/> 
		<ul>
			<xsl:apply-templates select="./step"/>
		</ul>		
	</xsl:template>	

	<xsl:template match="step">
	
		<!-- Each Step -->
		<div class="accordion-group">
			<div class="accordion-heading">	
				<a class="accordion-toggle" href="#{position()}"></a>
			</div>
			<div class="accordion-body" id="{position()}">
		<xsl:apply-templates select="./*"/>
	
			</div>
			<!-- /Serviços -->
		</div>

	
		<p/>
		<p/>
	</xsl:template>	

	<xsl:template match="operation">
		<a name="p2">
			<xsl:value-of select="number/@value"/>. </a>
		<xsl:value-of select="name/@value"/>
		<p/>
		...description...<xsl:value-of select="description/@value"/>
		<p/>
		<xsl:apply-templates select="./request"/>
		<p/>
		<xsl:apply-templates select="./response"/>
		<p/>		


	</xsl:template>	

	<xsl:template match="alternative">



	<a name="p2">Alternative:
			<xsl:value-of select="number/@value"/>
		</a>
		<xsl:value-of select="name/@value"/>
		<xsl:value-of select="description/@value"/>


			<!-- IF STEP IS ALTERNATIVE -->
			<div class="accordion-inner">
				<div class="accordion">
						<xsl:apply-templates select="./option"/>

<!--
				<div class="accordion-group">
						<div class="accordion-heading ponto">
							<a class="accordion-toggle" data-toggle="collapse" href="{position()}">Option1 #1-1-1</a>
						</div>
						<div class="accordion-body" id="{position()}">
						<xsl:apply-templates select="./option"/>
						</div>
					</div>
					-->

				</div>
			</div>

	</xsl:template>	

	<xsl:template match="option">

<xsl:variable name="id" select="position()" />
<xsl:variable name="optionname" select="./description/@value" />
		<div class="accordion-group">
			<div class="accordion-heading ponto">
				<a class="accordion-toggle" data-parent="{$id}" data-toggle="collapse" href= "#{$id}"><xsl:value-of select="$id"/> - <xsl:value-of select="./description/@value"/></a>
			</div><!-- Serviços -->
			<div class="accordion-body" id="{$id}">
				<xsl:apply-templates select="./*"/>
			</div><!-- /Serviços -->
		</div>


	</xsl:template>	


	<xsl:template match="pause">
		(pause)
	</xsl:template>	


	<xsl:template  match="request">
		<b>Request</b> (<xsl:value-of select="../receiver/@value"/> - <xsl:value-of select="../initiator/@value"/>):   
		<xsl:apply-templates select="./resourceId"/>		
	</xsl:template>	

	<xsl:template  match="response">
		<b>Response</b> (<xsl:value-of select="../receiver/@value"/> - <xsl:value-of select="../initiator/@value"/>):   
		<xsl:apply-templates select="./resourceId"/>
	</xsl:template>	



	<xsl:template  match="resourceId">
		<xsl:variable name="iid" select="./@value"/>
		<a href="example-instances.html#{/ExampleScenario/instance[resourceId/@value=$iid]/resourceId/@value}">
			<xsl:value-of select="/ExampleScenario/instance[resourceId/@value=$iid]/name/@value"/>
		</a>
	</xsl:template> 	





</xsl:stylesheet>