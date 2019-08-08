<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rde="urn:customs.ru:Information:CustomsDocuments:ResolutionDestinationExamination:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template name="russian_date2">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="rde:ResolutionDestinationExamination">
      <html>
         <head>
            <title>Решение о назначении таможенной экспертизы</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" colspan="3" style="width:190mm">
									ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="3" style="width:190mm">
                           <xsl:value-of select="rde:Customs/cat_ru:Code"/>, <xsl:value-of select="rde:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(наименование таможенного органа)
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="3" style="width:190mm">
									Решение 
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="3" style="width:190mm">
								о назначении таможенной экспертизы
								</td>
                        <!--td style="width:63mm" class="bold2" align="center">
									<xsl:value-of select="rde:NameExamination"/>
								</td>
								<td style="width:63mm" class="bold" align="left">
								экспертизы
								</td-->
                     </tr>
                     <tr>
                        <td align="center" class="graphMain" colspan="3" style="width:190mm">
								 по ДТ № 
							<span class="normal">
                              <xsl:if test="rde:GTDID">
                                 <xsl:value-of select="rde:GTDID/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date2">
                                    <xsl:with-param name="dateIn" select="rde:GTDID/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>/<xsl:value-of select="rde:GTDID/cat_ru:GTDNumber"/>
                              </xsl:if>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="rde:OtherDocument">
                                 <xsl:value-of select="rde:OtherDocument/cat_ru:PrDocumentName"/>
                                 <xsl:if test="rde:OtherDocument/cat_ru:PrDocumentNumber"> №
										<xsl:value-of select="rde:OtherDocument/cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:if test="rde:OtherDocument/cat_ru:PrDocumentDate"> от
										<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rde:OtherDocument/cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                              </xsl:if>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(и/или реквизиты иных документов (книжка МДП, транспортные (перевозочные) документы,  <br/> коммерческие документы и прочие документы таможенного контроля))
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:63mm">
								г.  <xsl:value-of select="rde:Country"/>
                        </td>
                        <td style="width:63mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:63mm">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rde:Date"/>
                           </xsl:call-template> года
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" colspan="3" style="width:190mm">
                           <xsl:value-of select="rde:InfoCustomsPersonDetermineAim/cat_ru:PersonName"/>, 
									<xsl:value-of select="rde:Customs/cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:Customs/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(должность, фамилия, инициалы должностного лица, наименование таможенного органа)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
									при осуществлении таможенных операций, проведении таможенного контроля


								</td>
                     </tr>
                     <tr>
                        <td align="center" class="bold" colspan="3" style="width:190mm">
								Установил:
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" colspan="3" style="width:190mm">
                           <xsl:value-of select="rde:Reason"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(краткое изложение обстоятельств, основания и цель проведения таможенной экспертизы или номер профиля риска, приказа, распоряжения ФТС России)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
									Принимая во внимание, что при осуществлении таможенных операций и проведении таможенного контроля необходимо исследовать ряд вопросов, требующих специальных познаний, руководствуясь статьей 138 Таможенного кодекса Таможенного союза, принял решение:
								</td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:55mm">
								1. Назначить проведение
								</td>
                        <td align="center" class="normal" style="width:70mm">
                           <xsl:value-of select="rde:NameExamination"/>, 
								<xsl:if test="rde:KindExamination = '1.'">
								дополнительная
								</xsl:if>
                           <xsl:if test="rde:KindExamination = '2.'">
								повторная
								</xsl:if>
                           <xsl:if test="rde:KindExamination = '3.'">
								комиссионная
								</xsl:if>
                           <xsl:if test="rde:KindExamination = '4.'">
								комплексная
								</xsl:if>
                        </td>
                        <td align="left" class="graphMain" style="width:65mm">
								таможенной экспертизы, поручив ее
								</td>
                     </tr>
                     <tr>
                        <!--td style="width:55mm" class="graphMain" align="left">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td-->
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(вид таможенной экспертизы в соответствии со статьей 143 Таможенного кодекса Таможенного союза)
								</td>
                        <!--td style="width:20mm" class="graphMain" align="left">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td-->
                     </tr>
                     <tr>
                        <!--td style="width:55mm" class="graphMain" align="left">поручив ее </td-->
                        <td align="center" class="normal" colspan="3" style="width:190mm">
                           <xsl:if test="rde:CommissionExamination/rde:Organization">
                              <xsl:value-of select="rde:CommissionExamination/rde:Organization/cat_ru:OrganizationName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rde:CommissionExamination/rde:Organization/cat_ru:ShortName"/>
                              <xsl:text> </xsl:text>
                              <xsl:if test="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: 
								<xsl:value-of select="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН: 
								<xsl:value-of select="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                                 <xsl:text> </xsl:text>
                              </xsl:if>
                              <xsl:if test="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП: 
								<xsl:value-of select="rde:CommissionExamination/rde:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              </xsl:if>
                           </xsl:if>
                           <xsl:if test="rde:CommissionExamination/rde:Customs">
                              <xsl:value-of select="rde:CommissionExamination/rde:Customs/cat_ru:Code"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="rde:CommissionExamination/rde:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:55mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:135mm">
								(фамилия, имя и отчество эксперта или наименование иной уполномоченной организации либо таможенного органа, в котором должна быть проведена таможенная экспертиза)
								</td>
                     </tr>
                     <!--tr>
								<td style="width:190mm" class="normal" align="center" colspan="3">
									<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Expert/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Expert/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Expert/cat_ru:PersonMiddleName"/>,
								<xsl:if test="rde:CommissionExamination/rde:InfoExpert/rde:Profession">
										<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Profession"/>, </xsl:if>
									<xsl:if test="rde:CommissionExamination/rde:InfoExpert/rde:Standing">
										<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Standing"/> лет/год(а),  </xsl:if>
									<xsl:if test="rde:CommissionExamination/rde:InfoExpert/rde:Profession">
										<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Profession"/>, </xsl:if>
									<xsl:value-of select="rde:CommissionExamination/rde:InfoExpert/rde:Expert/cat_ru:PersonPost"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" align="center" style="width:190mm" colspan="3">
								фамилия, инициалы эксперта, специальности, стаж работы по ней, ученая степень, должность)
								</td>
							</tr-->
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">2. Срок проведения таможенной экспертизы и представления заключения таможенного <br/>эксперта (эксперта) в таможенный орган (согласно части 4 статьи 138 Таможенного кодекса<br/> Таможенного союза): </td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" colspan="3" style="width:190mm">
                           <xsl:if test="rde:TermRealizationExamination/rde:TermDay">
                              <xsl:value-of select="rde:TermRealizationExamination/rde:TermDay"/> дней</xsl:if>
                           <xsl:if test="rde:TermRealizationExamination/rde:BeginDate"> c 
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rde:TermRealizationExamination/rde:BeginDate"/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                           </xsl:if>
                           <xsl:if test="rde:TermRealizationExamination/rde:EndDate">по 
									<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rde:TermRealizationExamination/rde:EndDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <!--td style="width:55mm" class="graphMain" align="left">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td-->
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">	
							(устанавливается с учетом трудоемкости экспертизы по согласованию с начальником Центрального экспертно- <br/>криминалистического таможенного управления (начальником экспертно-криминалистической службы <br/> регионального филиала Центрального экспертно-криминалистического таможенного управления, в пределах сроков, <br/>установленных частью 2 статьи 139 Таможенного кодекса Таможенного союза))
							</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm"> 3. Поставить перед таможенным экспертом/экспертом(ами) вопросы:</td>
                     </tr>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="rde:Question">
                              <td align="center" class="normal" colspan="3" style="width:190mm">
                                 <xsl:for-each select="rde:Question">
                                    <xsl:value-of select="."/>
                                 </xsl:for-each>
                              </td>
                           </xsl:when>
                           <xsl:otherwise>
                              <td align="center" class="normal" colspan="3" style="width:190mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </xsl:otherwise>
                        </xsl:choose>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								4. В распоряжение таможенного эксперта/эксперта(ов) представить: 	</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" colspan="3" style="width:190mm">
                           <xsl:value-of select="rde:GoodsAccordanceExhert/rde:ListSample"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(перечень проб, 
								</td>
                     </tr>
                     <xsl:for-each select="rde:GoodsAccordanceExhert/rde:Documents">
                        <tr>
                           <td align="center" class="normal" colspan="3" style="width:190mm">
                              <xsl:value-of select="cat_ru:PrDocumentName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:PrDocumentNumber"/> от 
							<xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                              </xsl:call-template> г.
							</td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="center" class="graphLittle" colspan="3" style="width:190mm">
								образцов или иных объектов исследования с приложенной к ним документацией)
								</td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:20mm">
								5. Поручить
								</td>
                        <td align="center" class="normal" style="width:170mm">
                           <xsl:value-of select="rde:Person/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:Person/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:Person/cat_ru:PersonMiddleName"/>
                           <xsl:if test="rde:Person/cat_ru:PersonPost"> / 
								<xsl:value-of select="rde:Person/cat_ru:PersonPost"/> /							
								</xsl:if>
                        </td>
                        <td align="left" class="graphMain" style="width:10mm">
								разъяснить 
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:80mm">
								(кому именно)
								</td>
                        <td align="left" class="graphMain" style="width:60mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								таможенному эксперту его права и ответственность.
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
								Должностное лицо
								</td>
                        <td align="center" class="normal" colspan="2" style="width:140mm">
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="rde:InfoCustomsPerson/rde:CustomsPerson/cat_ru:LNP"> ЛНП:
								<xsl:value-of select="rde:InfoCustomsPerson/rde:CustomsPerson/cat_ru:LNP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:140mm">
								(должность, специальное звание, фамилия, инициалы, подпись)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								Служебный телефон должностного лица, назначившего экспертизу:
								</td>
                     </tr>
                     <tr>
                        <td align="center" class="normal" style="width:50mm">
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:OfficialTelephone"/>
                        </td>
                        <td align="center" colspan="2" style="width:140mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
								Адрес таможенного органа:
								</td>
                        <td align="center" class="normal" colspan="2" style="width:140mm">
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:PostalCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:CountryCode"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:CounryName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:Region"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:City"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:InfoCustomsPerson/rde:Address/cat_ru:StreetHouse"/>
                           <xsl:text> </xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								СОГЛАСОВАНО<br/>начальник таможенного органа
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="2" style="width:130mm">
                           <span class="normal">
                              <xsl:value-of select="rde:CustomsChief/cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rde:CustomsChief/cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="rde:CustomsChief/cat_ru:PersonMiddleName"/>
                           </span>
                        </td>
                        <td align="center" style="width:60mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								Права и обязанности, предусмотренные статьей 140 Таможенного кодекса Таможенного <br/>
								союза, мне разъяснены “
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rde:DateDuties"/>
                           </xsl:call-template> г.
								Одновременно я предупрежден(а)<br/>
об административной ответственности за дачу заведомо ложного заключения в соответствии со <br/> статьей 19.26 Кодекса Российской Федерации об административных правонарушениях.

								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
								Таможенный эксперт (эксперт)
								</td>
                        <td style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:60mm">
                           <xsl:value-of select="rde:ExpertSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:ExpertSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:ExpertSignature/cat_ru:PersonMiddleName"/>
                           <xsl:if test="rde:ExpertSignature/cat_ru:PersonPost"> /
								<xsl:value-of select="rde:ExpertSignature/cat_ru:PersonPost"/> /
								</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:50mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphMain" style="width:60mm">
								(подпись)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								Права декларанта, иного лица, обладающего полномочиями в отношении товаров и (или) <br/>транспортных средств, и их представителей при назначении и проведении таможенной <br/> экспертизы, предусмотренные статьей 141 Таможенного кодекса Таможенного союза, мне<br/>разъяснены
								<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="rde:DateRights"/>
                           </xsl:call-template> г.
									</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
							Видоизменение, частичное или полное уничтожение, разрушение материалов, документов проб и образцов исследования 
							<xsl:choose>
                              <xsl:when test="(rde:Changes = 1) or (rde:Changes = 't') or (rde:Changes = 'true')">
								разрешить.
								</xsl:when>
                              <xsl:otherwise>
								не разрешить.
								</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="left" class="graphMain" style="width:80mm">
								Декларант
								</td>
                        <td style="width:10mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:100mm">
                           <xsl:value-of select="rde:DeclarantSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:DeclarantSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:DeclarantSignature/cat_ru:PersonMiddleName"/>
                           <xsl:if test="rde:DeclarantSignature/cat_ru:PersonPost"> /
								<xsl:value-of select="rde:DeclarantSignature/cat_ru:PersonPost"/> /
								</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:10mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphMain" style="width:100mm">
								(подпись)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:80mm">
								Лицо, обладающее полномочиями в отношении товаров и (или) транспортных средств (№ и дата документа, подтверждающего полномочия)
																</td>
                        <td style="width:10mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:100mm">
                           <xsl:value-of select="rde:PersonSignature/cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:PersonSignature/cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="rde:PersonSignature/cat_ru:PersonMiddleName"/>
                           <xsl:if test="rde:PersonSignature/cat_ru:PersonPost"> /
								<xsl:value-of select="rde:PersonSignature/cat_ru:PersonPost"/> /
								</xsl:if>
                           <xsl:if test="rde:PersonSignature/rde:AuthoritesDocument">
                              <xsl:value-of select="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:PrDocumentName"/>
                              <xsl:if test="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:PrDocumentNumber"> №
									<xsl:value-of select="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                              <xsl:if test="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:PrDocumentDate"> от
								<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template> г.
									
								</xsl:if>
                              <xsl:if test="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:ComplationAuthorityDate"> до
								<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rde:PersonSignature/rde:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                 </xsl:call-template> г.
										</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" style="width:80mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:10mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphMain" style="width:100mm">
								(подпись)
								</td>
                     </tr>
                     <tr>
                        <td align="left" class="graphMain" colspan="3" style="width:190mm">
								Представители
								</td>
                     </tr>
                     <xsl:for-each select="rde:RepresentativeSignature">
                        <tr>
                           <td align="left" class="graphMain" colspan="2" style="width:90mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="normal" colspan="3" style="width:100mm">
                              <xsl:value-of select="cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:PersonMiddleName"/>
                              <xsl:if test="cat_ru:PersonPost"> /
								<xsl:value-of select="cat_ru:PersonPost"/> /
								</xsl:if>
                              <xsl:if test="rde:AuthoritesDocument">
                                 <xsl:value-of select="rde:AuthoritesDocument/cat_ru:PrDocumentName"/>
                                 <xsl:if test="rde:AuthoritesDocument/cat_ru:PrDocumentNumber"> №
									<xsl:value-of select="rde:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:if test="rde:AuthoritesDocument/cat_ru:PrDocumentDate"> от
								<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rde:AuthoritesDocument/cat_ru:PrDocumentDate"/>
                                    </xsl:call-template> г.
									
								</xsl:if>
                                 <xsl:if test="rde:AuthoritesDocument/cat_ru:ComplationAuthorityDate"> до
								<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rde:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
                                    </xsl:call-template> г.
										</xsl:if>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graphMain" style="width:80mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" style="width:10mm">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphMain" style="width:100mm">
								(подпись)
								</td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
