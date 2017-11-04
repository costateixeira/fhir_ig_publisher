<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="pref" select="pref"/>
	<xsl:template match="/">
		<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
			<h3>
				<a name="description"/>Description</h3>
			<p>
				<xsl:value-of select="/ExampleScenario/description/@value"/>
			</p>
			<h4>
				<a name="preconditions"/>Pre-Conditions</h4>
			<p>
				<xsl:value-of select="/ExampleScenario/process/preConditions/@value"/>
			</p>
			<h4>
				<a name="postconditions"/>Post Conditions</h4>
			<p>
				<xsl:value-of select="/ExampleScenario/process/postConditions/@value"/>
			</p>
			<p/>
			<div id="segment-content" class="segment">
				<!-- segment-content -->
				<div class="container">
					<!-- container -->
					<div class="row">
						<div class="inner-wrapper">
							<!-- CONTENT CONTENT -->
							<div class="col-12">
								<ul class="nav nav-tabs">
									<li>
										<a href="{$pref}diagram.html#">Content</a>
									</li>
									<li class="active">
										<a href="{$pref}details.html#">Details</a>
									</li>
									<li>
										<a href="{$pref}resources.html#">Resources</a>
									</li>
								</ul>

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
								</div>
								<div>
									<h2>Actors</h2>
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
								</div>
								<div>
									<xsl:apply-templates select="/ExampleScenario/process"/>
								</div>

								<!--
							-->

							</div>

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
		<xsl:value-of select="description/@value"/>
		<p/>

		<xsl:apply-templates select="step"/>

	</xsl:template>	

	<xsl:template match="process"> 
		<xsl:value-of select="title/@value"/> 
		<ul>
			<xsl:apply-templates select="./step"/>
		</ul>		
	</xsl:template>	

	<xsl:template match="step">
		<xsl:apply-templates select="./*"/>
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
		<div id="accordion">
			<xsl:apply-templates select="./option"/>
		</div>
	</xsl:template>	

	<xsl:template match="option">
		<h3>
			<a name="p2">
				<xsl:value-of select="description/@value"/>. </a>
		</h3>
		<div>
			<xsl:apply-templates select="./*"/>
		</div>
	</xsl:template>	


	<xsl:template match="pause">
			(...)
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