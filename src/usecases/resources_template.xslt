﻿<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="pref" select="pref"/>
	<xsl:template match="/">
		<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../../../schema/fhir-single.xsd">
			<h3><a name="description"/>Description</h3>
			<p><xsl:value-of select="/ExampleScenario/description/@value"/></p>
			<h4><a name="preconditions"/>Pre-Conditions</h4>
			<p><xsl:value-of select="/ExampleScenario/process/preConditions/@value"/></p>
			<h4><a name="postconditions"/>Post Conditions</h4>
			<p><xsl:value-of select="/ExampleScenario/process/postConditions/@value"/></p>
			<br/>
			<div id="segment-content" class="segment">
				<!-- segment-content -->
				<div class="container">
					<!-- container -->
					<div class="row">
						<div class="inner-wrapper">
							<!-- CONTENT CONTENT -->
							<div class="col-12"></div>
							<ul class="nav nav-tabs">
								<li>
									<a href="{$pref}diagram.html#">Content</a>
								</li>
								<li>
									<a href="{$pref}details.html#">Details</a>
								</li>
								<li class="active">
									<a href="{$pref}resources.html#">Resources</a>
								</li>
							</ul>

							<img alt="Interaction diagram showing flow" src="{$pref}diagram.png" usemap="#diagram_map"/>
							<xsl:value-of select="unparsed-text('./diagram.cmapx')" disable-output-escaping="yes"/>

							<!--									<ul>
								<div id="tabs">
										<li>
											<a href="#tabs-struc">Diagram</a>
										</li>
										<li>
											<a href="#tabs-uml">Source</a>
										</li>
									</ul>
-->

							<div id="tabs-struc">
								<div id="tbl">

									<p>
										<b>Structure</b>
									</p>


									<p>
										<b>UML Diagram</b> (<a href="formats.html#uml">Legend</a>)</p>
									<p>df sdfs dfsdf</p>
								</div>

								<!-- /inner-wrapper -->
							</div>
							<!-- /row -->
							<!--									
								</div>
-->

							<!-- /container -->

						</div>
					</div>

				</div>
			</div>

		</div>


	</xsl:template>




</xsl:stylesheet>