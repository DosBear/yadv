<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:le="urn:customs.ru:Information:SQDocuments:LegalEntityInfo:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="le:LegalEntityInfo">
      <html>
         <head>
            <title>Краткие сведения по юр. лицу/Сведения об учете организации в налоговом органе по месту нахождения ее обособленного подразделения</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>
                              <xsl:if test="le:DocSign='1'">Краткие сведения по юр. лицу</xsl:if>
                              <xsl:if test="le:DocSign='2'">Сведения об учете организации в налоговом органе по месту нахождения ее обособленного подразделения</xsl:if>
                              <xsl:if test="le:DocSign='3'">Выписка о юр. лице</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="le:ResultCode">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Код обработки: <xsl:value-of select="le:ResultCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="le:FormDate">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Дата формирования сведений из ЕГРЮЛ в отношении юридического лица: 
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="le:FormDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <b>Сведения о  юридическом лице:</b>
                        <br/>
                        <xsl:apply-templates select="le:BaseDetails"/>
                     </td>
                  </tr>
                  <xsl:if test="le:AuthorizedOrg">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения о лице, имеющем право без доверенности действовать от имени юридического лица:</b>
                           <br/>
                           <xsl:for-each select="le:AuthorizedOrg">
                              <xsl:value-of select="position()"/>. 
								<xsl:apply-templates select="."/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="le:TaxRegInfo">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения об учете в налоговом органе:</b>
                           <br/>
                           <xsl:apply-templates select="le:TaxRegInfo"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="le:PensionServiceReg">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения о регистрации юридического лица в качестве страхователя в территориальном органе Пенсионного фонда РФ:</b>
                           <br/>
                           <xsl:apply-templates select="le:PensionServiceReg"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="le:InsuranceServiceReg">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения о регистрации юридического лица в качестве страхователя в исполнительном органе Фонда социального страхования РФ:</b>
                           <br/>
                           <xsl:apply-templates select="le:InsuranceServiceReg"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="le:License">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения о лицензии:</b>
                           <br/>
                           <xsl:for-each select="le:License">
                              <xsl:apply-templates select="."/>
                              <table>
                                 <xsl:if test="le:BeginDate">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Дата начала действия документа</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="le:BeginDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:ExpirationDate">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Дата окончания действия документа</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="le:ExpirationDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:LicenseSeries">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Серия документа</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:LicenseSeries"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:LicenseKind">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Вид лицензии</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:LicenseKind"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:LicensedServiceName">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Наименование лицензируемого вида деятельности</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:LicensedServiceName"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:apply-templates select="le:RecordData"/>
                                    </td>
                                 </tr>
                              </table>
                              <xsl:if test="le:LicensedServicePlace">
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">Сведения об месте осуществления лицензируемого вида деятельности:</td>
                                    </tr>
                                    <xsl:for-each select="le:LicensedServicePlace">
                                       <tr>
                                          <td class="graph" style="border:solid 0pt">
                                             <xsl:value-of select="position()"/>. 
												<xsl:apply-templates select="."/>
                                          </td>
                                       </tr>
                                       <xsl:if test="position()!=last()">
                                          <tr>
                                             <td class="graph" style="border:solid 0pt"> </td>
                                          </tr>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </table>
                              </xsl:if>
                              <xsl:if test="le:LicenseOrg">
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">Наименование лицензирующего органа, выдавшего или переоформившего лицензию:</td>
                                    </tr>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">
                                          <xsl:if test="le:LicenseOrg/le:OrganName">
                                             <xsl:value-of select="le:LicenseOrg/le:OrganName"/>
                                          </xsl:if>
                                          <xsl:if test="le:LicenseOrg/le:OrganCode"> (<xsl:value-of select="le:LicenseOrg/le:OrganCode"/>)</xsl:if>
                                          <xsl:if test="le:LicenseOrg/le:RegOrganAddress">
                                             <br/>Адрес налогового органа: <xsl:apply-templates select="le:LicenseOrg/le:RegOrganAddress"/>
                                          </xsl:if>
                                       </td>
                                    </tr>
                                 </table>
                              </xsl:if>
                              <xsl:if test="le:Suspension">
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt"> </td>
                                    </tr>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">Дата приостановления 
												<xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="le:Suspension/le:EndDate"/>
                                          </xsl:call-template>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt">
                                          <xsl:apply-templates select="le:Suspension/le:RegOrgan"/>
                                       </td>
                                    </tr>
                                 </table>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt"> </td>
                                    </tr>
                                 </table>
                              </xsl:if>
                              <xsl:if test="position()!=last()">
                                 <tr>
                                    <td class="graph" style="border:solid 0pt">
                                       <table>
                                          <tr>
                                             <td class="graph" style="border:solid 0pt"> </td>
                                          </tr>
                                       </table>
                                    </td>
                                 </tr>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="le:RecordDescription">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <b>Сведения о записях, внесенных в ЕГРЮЛ: </b>
                        </td>
                     </tr>
                     <xsl:for-each select="le:RecordDescription">
                        <tr>
                           <td>
                              <table>
                                 <tr>
                                    <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
                                       <xsl:value-of select="le:Name"/> 
								(<xsl:value-of select="le:Code"/>)
								</td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000" width="50%">Признак</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="le:RecordSign='0' or le:RecordSign='f' or le:RecordSign='false'">Недействительная</xsl:if>
                                       <xsl:if test="le:RecordSign='1' or le:RecordSign='t' or le:RecordSign='true'">Действующая</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">Дата внесения сведений о выданном свидетельстве в ЕГРЮЛ / Дата внесения сведений в ЕГРЮЛ о признании записи недействительной</td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="le:InputDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                                 <xsl:if test="le:RecordRegNum">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Государственный регистрационный номер записи</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:RecordRegNum"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:BlankSeries">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Серия бланка свидетельства</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:BlankSeries"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <xsl:if test="le:BlankNum">
                                    <tr>
                                       <td class="graph" style="border:solid 1pt #000000">Номер бланка свидетельства</td>
                                       <td class="graph" style="border:solid 1pt #000000">
                                          <xsl:value-of select="le:BlankNum"/>
                                       </td>
                                    </tr>
                                 </xsl:if>
                              </table>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <xsl:apply-templates select="le:RegOrgan"/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <xsl:apply-templates select="le:RecordData"/>
                           </td>
                        </tr>
                        <xsl:if test="position()!=last()">
                           <tr>
                              <td class="graph" style="border:solid 0pt">
                                 <table>
                                    <tr>
                                       <td class="graph" style="border:solid 0pt"> </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="le:BaseDetails">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="le:OGRNDate">
         <br/>Дата присвоения ОГРН  
						<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="le:OGRNDate"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="le:BrandName">Фирменное наименование юридического лица: <xsl:value-of select="le:BrandName"/>
         <br/>
      </xsl:if>
      <xsl:if test="le:OrgStatusInfo">
         <u>Сведения о правоспособности (статусе) юридического лица</u>: 
			<table>
            <tr>
               <td class="graph" style="border:solid 1pt #000000" width="30%">Дата начала действия указанных сведений</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="le:OrgStatusInfo/le:StartDate"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Код статуса юридического лица по справочнику СЮЛСТ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:OrgStatusInfo/le:StatusCode"/>
               </td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Наименование статуса юридического лица по справочнику СЮЛСТ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:OrgStatusInfo/le:StatusName"/>
               </td>
            </tr>
            <xsl:if test="le:OrgStatusInfo/le:RegOrgan">
               <tr>
                  <td class="graph" style="border:solid 1pt #000000">Сведения о регистрирующем (налоговом) органе по месту нахождения юр. лица</td>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:if test="le:OrgStatusInfo/le:RegOrgan/le:OrganName">
                        <xsl:value-of select="le:OrgStatusInfo/le:RegOrgan/le:OrganName"/>
                     </xsl:if>
                     <xsl:if test="le:OrgStatusInfo/le:RegOrgan/le:OrganCode"> (<xsl:value-of select="le:OrgStatusInfo/le:RegOrgan/le:OrganCode"/>)</xsl:if>
                     <xsl:if test="le:OrgStatusInfo/le:RegOrgan/le:RegOrganAddress">
                        <br/>Адрес налогового органа: <xsl:apply-templates select="le:OrgStatusInfo/le:RegOrgan/le:RegOrganAddress"/>
                     </xsl:if>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="le:OrgStatusInfo/le:RecordData">
               <tr>
                  <td class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:apply-templates select="le:OrgStatusInfo/le:RecordData"/>
                  </td>
               </tr>
            </xsl:if>
         </table>
      </xsl:if>
      <xsl:if test="le:OrgAddress">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" colspan="2" style="border:solid 0pt">
                  <u>
					Сведения об адресе (месте нахождения) постоянно действующего исполнительного органа юр. лица</u>: 
					<xsl:apply-templates select="le:OrgAddress"/>
                  <xsl:if test="le:OrgAddress/le:ImpossibleContact">Признак невозможности взаимодействия с юридическим лицом по содержащемуся в ЕГРЮЛ адресу:
					<xsl:if test="le:OrgAddress/le:ImpossibleContact='1'"> адрес, указанный юр. лицом при государственной регистрации, 
					не существует</xsl:if>
                     <xsl:if test="le:OrgAddress/le:ImpossibleContact='0'"> юр. лицо не располагается по адресу, указанному при государственной 
					регистрации</xsl:if>
                     <br/>
                  </xsl:if>
                  <xsl:if test="le:OrgAddress/le:RecordData">
                     <xsl:apply-templates select="le:OrgAddress/le:RecordData"/>
                  </xsl:if>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:BranchDescription">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" colspan="4" style="border:solid 0pt">
                  <u>
					Сведения об обособленном подразделении</u>:
					</td>
            </tr>
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000">Обособленное подразделение</td>
               <td align="center" class="graph" style="border:solid 1pt #000000">Вид подразделения</td>
               <td align="center" class="graph" style="border:solid 1pt #000000">Адрес места расположения за пределами территории РФ</td>
               <td align="center" class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
            </tr>
            <xsl:for-each select="le:BranchDescription">
               <tr>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:apply-templates select="."/>
                  </td>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:if test="le:BranchKind='1'">Представи-<br/>тельство</xsl:if>
                     <xsl:if test="le:BranchKind='0'">Филиал</xsl:if>
                  </td>
                  <td class="graph" style="border:solid 1pt #000000" valign="top">
                     <xsl:if test="le:ForeignAddress">
                        <xsl:apply-templates select="le:ForeignAddress"/>
                     </xsl:if>
                  </td>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:if test="le:RecordData">
                        <xsl:apply-templates select="le:RecordData"/>
                     </xsl:if>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
      </xsl:if>
      <xsl:if test="le:OrganizationForm">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения об организационно-правовой форме</u>:</td>
            </tr>
            <xsl:if test="le:OrganizationForm/le:ClassifierName">
               <tr>
                  <td class="graph" style="border:solid 0pt">Наименование классификатора: <xsl:value-of select="le:OrganizationForm/le:ClassifierName"/>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="le:OrganizationForm/le:ClassifierCode">
               <tr>
                  <td class="graph" style="border:solid 0pt">Код по выбранному классификатору: <xsl:value-of select="le:OrganizationForm/le:ClassifierCode"/>
                  </td>
               </tr>
            </xsl:if>
            <tr>
               <td class="graph" style="border:solid 0pt">Полное наименование организационно-правовой формы: <xsl:value-of select="le:OrganizationForm/le:FormName"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:RecordData">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о записи</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:if test="le:RecordData">
                     <xsl:apply-templates select="le:RecordData"/>
                  </xsl:if>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:LegalEntityFormation">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения об образовании юридического лица</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:if test="le:LegalEntityFormation">
                     <xsl:apply-templates select="le:LegalEntityFormation"/>
                  </xsl:if>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:SuccessionData">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о правопреемстве</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:if test="le:SuccessionData/le:SuccessionCode">Код преемства по справочнику СВПРЮЛ: <xsl:value-of select="le:SuccessionData/le:SuccessionCode"/>
                     <br/>
                  </xsl:if>
                  <xsl:if test="le:SuccessionData/le:OGRNIP">ОГРНИП: <xsl:value-of select="le:SuccessionData/le:OGRNIP"/>
                     <br/>
                  </xsl:if>
                  <xsl:if test="le:SuccessionData/le:INN">ИНН физического лица: <xsl:value-of select="le:SuccessionData/le:INN"/>
                     <br/>
                  </xsl:if>
               </td>
            </tr>
            <xsl:if test="le:SuccessionData/le:SelfSuccessor">
               <tr>
                  <td class="graph" style="border:solid 0pt"> </td>
               </tr>
               <tr>
                  <td class="graph" style="border:solid 0pt">Сведения о юридическом лице, правопреемником которого являлось юридическое лицо при создании путем реорганизации или при реорганизации в форме присоединения:
					<br/>
                     <xsl:for-each select="le:SuccessionData/le:SelfSuccessor">
                        <xsl:value-of select="position()"/>. 
					<xsl:apply-templates select="."/>
                        <xsl:if test="position()!=last()">
                           <br/>
                        </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="le:SuccessionData/le:OwnSuccessor">
               <tr>
                  <td class="graph" style="border:solid 0pt"> </td>
               </tr>
               <tr>
                  <td class="graph" style="border:solid 0pt">Сведения о юридическом лице - правопреемнике  при прекращении деятельности в результате реорганизации или при реорганизации в форме выделения:
					<br/>
                     <xsl:for-each select="le:SuccessionData/le:OwnSuccessor">
                        <xsl:value-of select="position()"/>. 
					<xsl:apply-templates select="."/>
                        <xsl:if test="position()!=last()">
                           <br/>
                        </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
            </xsl:if>
            <xsl:if test="le:SuccessionData/le:Farm">
               <tr>
                  <td class="graph" style="border:solid 0pt"> </td>
               </tr>
               <tr>
                  <td class="graph" style="border:solid 0pt">Сведения о крестьянском (фермерском) хозяйстве (КФХ), на базе имущества которого создано юридическое лицо, или о КФХ, сведения о котором внесены в ЕГРИП, при приведении статуса КФХ в соответствие с действующим законодательством:
					<br/>
                     <xsl:for-each select="le:SuccessionData/le:Farm">
                        <xsl:value-of select="position()"/>. 
					<xsl:apply-templates select="."/>
                        <xsl:if test="position()!=last()">
                           <br/>
                        </xsl:if>
                     </xsl:for-each>
                  </td>
               </tr>
            </xsl:if>
         </table>
      </xsl:if>
      <tr>
         <td class="graph" style="border:solid 0pt"> </td>
      </tr>
      <tr>
         <td class="graph" style="border:solid 0pt">
            <xsl:apply-templates select="le:SuccessionData/le:RecordData"/>
         </td>
      </tr>
      <xsl:if test="le:OrgCapital">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о размере указанного в учредительных документах коммерческой организации уставного капитала (складочного капитала, уставного фонда, 
					паевого фонда)</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:OrgCapital"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:CapitalReduction">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о нахождении хозяйственного общества в процессе уменьшения уставного капитала</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:CapitalReduction"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:Founder">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения об учредителе юридического лица</u>:</td>
            </tr>
            <xsl:for-each select="le:Founder">
               <tr>
                  <td class="graph" style="border:solid 0pt">
                     <xsl:apply-templates select="."/>
                  </td>
               </tr>
               <tr>
                  <td class="graph" style="border:solid 0pt"> </td>
               </tr>
               <tr>
                  <td class="graph" style="border:solid 0pt">
                     <table>
                        <tr>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Признак</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="5%">Код страны происхож-<br/>дения</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="10%">Страна происхож-<br/>дения</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="10%">Дата регистрации</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Регистрационный номер</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="10%">Дата открытия наследства</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Код вида учредителя</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="5%">Код субъекта РФ</td>
                           <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Наименование субъекта РФ/Наименование муниципального образования</td>
                        </tr>
                        <tr>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:OrgSign=1">Физическое лицо</xsl:if>
                              <xsl:if test="le:OrgSign=2">Российское юр. лицо</xsl:if>
                              <xsl:if test="le:OrgSign=3">Орган государственной власти или орган местного самоуправления</xsl:if>
                              <xsl:if test="le:OrgSign=4">Иностранное юридическое лицо</xsl:if>
                              <xsl:if test="le:OrgSign=5">Инвестиционный паевый фонд</xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:OriginCountryCode">
                                 <xsl:value-of select="le:OriginCountryCode"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:OriginCountryName">
                                 <xsl:value-of select="le:OriginCountryName"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:RegDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="le:RegDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:RegNum">
                                 <xsl:value-of select="le:RegNum"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:InheritanceOpenDate">
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="le:InheritanceOpenDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:FounderKindCode">
                                 <xsl:if test="le:FounderKindCode=1">Доля принадлежит РФ</xsl:if>
                                 <xsl:if test="le:FounderKindCode=2">Доля принадлежит субъекту РФ</xsl:if>
                                 <xsl:if test="le:FounderKindCode=3"> Доля принадлежит муниципальному образованию</xsl:if>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:RFSubjectCode">
                                 <xsl:value-of select="le:RFSubjectCode"/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:if test="le:RFSubjectName">
                                 <xsl:value-of select="le:RFSubjectName"/>
                              </xsl:if>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
               <xsl:if test="le:Share">
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Доля в уставном капитале:</td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:apply-templates select="le:Share"/>
                     </td>
                  </tr>
               </xsl:if>
               <tr>
                  <td class="graph" style="border:solid 0pt">
                     <xsl:apply-templates select="le:RecordData"/>
                  </td>
               </tr>
               <xsl:if test="le:RegOrgan">
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:apply-templates select="le:RegOrgan"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="le:ForeignAddress">
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Адрес места жительства (места пребывания) за пределами территории РФ: <xsl:apply-templates select="le:ForeignAddress"/>
                     </td>
                  </tr>
               </xsl:if>
               <xsl:if test="le:ShareManager">
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Сведения о лице, осуществляющем управление долей, переходящей в порядке наследования / Сведения об управляющей компании, осуществляющей доверительное управление:<br/>
                        <xsl:for-each select="le:ShareManager">
                           <xsl:apply-templates select="."/>
                           <xsl:if test="position()!=last()">
                              <tr>
                                 <td class="graph" style="border:solid 0pt"> </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
               </xsl:if>
            </xsl:for-each>
         </table>
      </xsl:if>
      <xsl:if test="le:LLCShare">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о доле, принадлежащей обществу с ограниченной ответственностью</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:LLCShare"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:Holder">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о держателе реестра акционеров акционерного общества</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:Holder"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:PermitPerson">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения о лице, имеющем право без доверенности действовать от имени юридического лица</u>:</td>
            </tr>
            <tr>
               <xsl:for-each select="le:PermitPerson">
                  <td class="graph" style="border:solid 0pt">
                     <xsl:apply-templates select="."/>
                  </td>
                  <xsl:if test="position()!=last()">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
               </xsl:for-each>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:ForeignPermitPerson">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <u>Сведения об управляющей организации - иностранном юридическом лице</u>:</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:ForeignPermitPerson"/>
               </td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:ForeignPermitPerson/le:ShareManager">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt"> </td>
            </tr>
         </table>
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">Сведения о лице, осуществляющем управление долей, переходящей в порядке наследования / Сведения об управляющей 
					компании, осуществляющей доверительное управление:</td>
            </tr>
            <tr>
               <xsl:for-each select="le:ForeignPermitPerson/le:ShareManager">
                  <td class="graph" style="border:solid 0pt">
                     <xsl:apply-templates select="."/>
                  </td>
                  <xsl:if test="position()!=last()">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
               </xsl:for-each>
            </tr>
         </table>
         <xsl:if test="le:Activity">
            <table>
               <tr>
                  <td class="graph" style="border:solid 0pt"> </td>
               </tr>
            </table>
            <table>
               <tr>
                  <td class="graph" colspan="3" style="border:solid 0pt">
                     <u>Сведения о кодах по Общероссийскому классификатору видов экономической деятельности</u>:</td>
               </tr>
               <tr>
                  <td align="center" class="graph" style="border:solid 1pt #000000" width="25%">Код по Общероссийскому классификатору видов экономической деятельности</td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">Признак</td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
               </tr>
               <xsl:for-each select="le:Activity">
                  <tr>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:value-of select="le:ActivityCode"/>
                     </td>
                     <td align="center" class="graph" style="border:solid 1pt #000000">
                        <xsl:if test="le:ActivitySign='0'">основной</xsl:if>
                        <xsl:if test="le:ActivitySign='1'">дополнительный</xsl:if>
                     </td>
                     <td class="graph" style="border:solid 1pt #000000">
                        <xsl:apply-templates select="le:RecordData"/>
                     </td>
                  </tr>
               </xsl:for-each>
            </table>
         </xsl:if>
      </xsl:if>
   </xsl:template>
   <xsl:template match="le:License">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if> 
		<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="le:TaxRegInfo | le:PensionServiceReg | le:InsuranceServiceReg">
      <table>
         <tr>
            <td class="graph" style="border:solid 1pt #000000" width="50%">Дата постановки на учет в налоговом органе / Дата регистрации юридического лица в качестве страхователя</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="le:RegDate"/>
               </xsl:call-template>
            </td>
         </tr>
         <xsl:if test="le:TaxRegDateEnd">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата снятия с учета в налоговом органе</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="le:TaxRegDateEnd"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RegNum">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Регистрационный номер в органе</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:RegNum"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RegData">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Регистрационные данные</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="le:RegData/cat_ru:OGRN">
                     <span>ОГРН: <xsl:value-of select="le:RegData/cat_ru:OGRN"/>
                     </span>
                     <br/>
                  </xsl:if>
                  <xsl:if test="le:RegData/cat_ru:INN">
                     <span>ИНН: <xsl:value-of select="le:RegData/cat_ru:INN"/>
                     </span>
                     <br/>
                  </xsl:if>
                  <xsl:if test="le:RegData/cat_ru:KPP">
                     <span>	КПП: <xsl:value-of select="le:RegData/cat_ru:KPP"/>
                     </span>
                  </xsl:if>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Сведения о налоговом органе, осуществившем постановку на учет юридического лица</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:if test="le:TaxOrgan/le:OrganName">
                  <xsl:value-of select="le:TaxOrgan/le:OrganName"/>
               </xsl:if>
               <xsl:if test="le:TaxOrgan/le:OrganCode"> (<xsl:value-of select="le:TaxOrgan/le:OrganCode"/>)</xsl:if>
               <xsl:if test="le:TaxOrgan/le:RegOrganAddress">
                  <br/>Адрес налогового органа: <xsl:apply-templates select="le:TaxOrgan/le:RegOrganAddress"/>
               </xsl:if>
            </td>
         </tr>
         <xsl:if test="le:RecordData">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:apply-templates select="le:RecordData"/>
               </td>
            </tr>
         </xsl:if>
         <tr>
            <td class="graph" style="border:solid 0pt"> </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="le:Share | le:LLCShare">
      <table>
         <xsl:if test="le:Numerator">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Размер доли в простых дробях. Числитель</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:Numerator"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:Denumerator">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Размер доли в простых дробях. Знаменатель</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:Denumerator"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:Percent">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Размер доли в процентах, %</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:Percent"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:DecimalFraction">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Размер доли в десятичных дробях</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:DecimalFraction"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:NominalCost">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Номинальная стоимость в рублях</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:NominalCost"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:PledgeSign">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Признак нахождения доли в залоге или о нахождении в ином обременении</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="le:PledgeSign='0' or le:PledgeSign='f' or le:PledgeSign='false'">нет</xsl:if>
                  <xsl:if test="le:PledgeSign='1' or le:PledgeSign='t' or le:PledgeSign='true'">да</xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RecordData">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:apply-templates select="le:RecordData"/>
               </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="le:ShareManager | le:Holder | le:PermitPerson | le:ForeignPermitPerson | le:AuthorizedOrg" name="Organization2">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Contact/cat_ru:Phone">Номер телефона:<xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Fax">Номер факса:<xsl:value-of select="cat_ru:Contact/cat_ru:Fax"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Telex">Номер телекса:<xsl:value-of select="cat_ru:Contact/cat_ru:Telex"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">Код организации по ОКПО:<xsl:value-of select="cat_ru:OKPOID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKATOCode">Код ОКАТО:<xsl:value-of select="cat_ru:OKATOCode"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
      <!--<xsl:apply-templates select="le:ShareManager"/>-->
      <br/>
      <table>
         <tr>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
               <xsl:if test="le:OrgSign=1">Физическое лицо</xsl:if>
               <xsl:if test="le:OrgSign=2">Российское юридическое лицо</xsl:if>
               <xsl:if test="le:OrgSign=3">Иностранное юридическое лицо</xsl:if>
            </td>
         </tr>
         <xsl:if test="le:PersonPost">
            <tr>
               <td class="graph" style="border:solid 1pt #000000" width="50%">Должность</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:PersonPost"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:PersonKindCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000" width="50%">Вид должностного лица по справочнику СКФЛЮЛ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:PersonKindCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:PersonKindName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000" width="50%">Наименование вида должностного лица по справочнику СКФЛЮЛ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:PersonKindName"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="cat_ru:Contact/cat_ru:Phone">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Телефон</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="cat_ru:Contact/cat_ru:Phone"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:OriginCountryCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Код страны происхождения</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:OriginCountryCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:OriginCountryName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Наименование страны происхождения</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:OriginCountryName"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RegDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата регистрации</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="le:RegDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RegNum">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Регистрационный номер</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:RegNum"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:BranchDescription">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Полное наименование представительства или филиала в РФ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:BranchDescription"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:InheritanceOpenDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата открытия наследства</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="le:InheritanceOpenDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:FounderKindCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Код вида учредителя</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="le:FounderKindCode=1">Доля принадлежит РФ</xsl:if>
                  <xsl:if test="le:FounderKindCode=2">Доля принадлежит субъекту РФ</xsl:if>
                  <xsl:if test="le:FounderKindCode=3"> Доля принадлежит муниципальному образованию</xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RFSubjectCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Код субъекта РФ</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:RFSubjectCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RFSubjectName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Наименование субъекта Российской Федерации / Наименование муниципального образования</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:RFSubjectName"/>
               </td>
            </tr>
         </xsl:if>
      </table>
      <br/>
      <xsl:if test="le:Share">Доля в уставном капитале:<br/>
         <xsl:apply-templates select="le:Share"/>
         <br/>
      </xsl:if>
      <xsl:if test="le:RecordData">
         <xsl:apply-templates select="le:RecordData"/>
         <br/>
      </xsl:if>
      <xsl:if test="le:ForeignAddress">Адрес места жительства (места пребывания) за пределами РФ: <xsl:apply-templates select="le:ForeignAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="le:Disqualification">
         <table>
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Срок дисквалификации (в месяцах)</td>
               <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Дата начала дисквалификации</td>
               <td align="center" class="graph" style="border:solid 1pt #000000" width="15%">Дата окончания дисквалификации</td>
               <td align="center" class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
            </tr>
            <xsl:for-each select="le:Disqualification">
               <tr>
                  <td align="center" class="graph" style="border:solid 1pt #000000">
                     <xsl:value-of select="le:DisqualifTerm"/>
                  </td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="le:DisqualifStartDate"/>
                     </xsl:call-template>
                  </td>
                  <td align="center" class="graph" style="border:solid 1pt #000000">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="le:DisqualifEndDate"/>
                     </xsl:call-template>
                  </td>
                  <td class="graph" style="border:solid 1pt #000000">
                     <xsl:apply-templates select="le:RecordData"/>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
         <br/>
      </xsl:if>
      <xsl:if test="le:AuthorizedPerson">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">Вид должностного лица: <xsl:value-of select="le:AuthorizedPerson/le:Name"/> (<xsl:value-of select="le:AuthorizedPerson/le:Code"/>)</td>
            </tr>
         </table>
      </xsl:if>
      <xsl:if test="le:RegOrgan">
         <table>
            <tr>
               <td class="graph" style="border:solid 0pt">
                  <xsl:apply-templates select="le:RegOrgan"/>
               </td>
            </tr>
         </table>
      </xsl:if>
   </xsl:template>
   <xsl:template match="le:OrgCapital | le:CapitalReduction">
      <table>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Размер уставного капитала / Величина, на которую уменьшается уставный капитал</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:value-of select="le:OrgCapitalAmount"/>
            </td>
         </tr>
         <xsl:if test="le:OrgCapitalName">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Наименование вида капитала</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:OrgCapitalName"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:ReduceWay">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Способ уменьшения уставного капитала общества</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="le:ReduceWay='0'">Путем уменьшения номинальной стоимости акций</xsl:if>
                  <xsl:if test="le:ReduceWay='1'">Путем сокращения общего количества акций</xsl:if>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:CurrencyCode">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Код валюты</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="le:CurrencyCode"/>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:DecisionDate">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Дата принятия решения об уменьшении уставного капитала</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="le:DecisionDate"/>
                  </xsl:call-template>
               </td>
            </tr>
         </xsl:if>
         <xsl:if test="le:RecordData">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Сведения о записи</td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:apply-templates select="le:RecordData"/>
               </td>
            </tr>
         </xsl:if>
      </table>
   </xsl:template>
   <xsl:template match="le:LegalEntityFormation | le:SelfSuccessor | le:OwnSuccessor | le:AuthorizedPerson">
	Наименование: <xsl:value-of select="le:Name"/> (<xsl:value-of select="le:Code"/>)<br/>
      <xsl:if test="le:RegDate">
	Дата регистрации:  
	<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="le:RegDate"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="le:RegNum">Регистрационный номер, присвоенный юридическому лицу при образовании: <xsl:value-of select="le:RegNum"/>
         <br/>
      </xsl:if>
      <xsl:apply-templates select="le:RecordData"/>
      <br/>
      <xsl:if test="le:RegOrgan">
         <xsl:apply-templates select="le:RegOrgan"/>
         <br/>
      </xsl:if>
      <xsl:if test="le:OrgInfo">Сведения о юридическом лице: <xsl:apply-templates select="le:OrgInfo"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="le:RecordData">
	Дата внесения сведений в ЕГРЮЛ: 
					<xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="le:RecordDate"/>
      </xsl:call-template>
      <xsl:if test="le:RecordRegNum">
         <br/>Государственный регистрационный номер записи: <xsl:value-of select="le:RecordRegNum"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="le:RegOrgan">
      <span class="graph"> Сведения о регистрирующем (налоговом) органе:<br/>
         <xsl:if test="le:OrganName">
            <xsl:value-of select="le:OrganName"/>
         </xsl:if>
         <xsl:if test="le:OrganCode"> (<xsl:value-of select="le:OrganCode"/>)</xsl:if>
         <xsl:if test="le:RegOrganAddress">
            <br/>Адрес налогового органа: <xsl:apply-templates select="le:RegOrganAddress"/>
         </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="le:BranchDescription | le:BranchDescription | le:BranchDescription | le:OrgInfo | le:Farm | le:Founder" name="Organization">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address | le:RegOrganAddress | le:OrgAddress | le:ForeignAddress | le:LicensedServicePlace">
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <xsl:if test="le:KLADRCode">
         <br/>Код адреса по КЛАДР: <xsl:value-of select="le:KLADRCode"/>
      </xsl:if>
      <xsl:if test="le:SubjectCode">
         <br/>Код субъекта РФ: <xsl:value-of select="le:SubjectCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
		Документ удостоверяющий личность:
		<br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
