<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rrsk  cat_ru " version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rrsk="urn:customs.ru:Information:CustomsDocuments:RevealedRisks:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="gtd_date">
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rrsk:RevealedRisks">
      <html>
         <head>
            <title>Отчет по выявленным рискам</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    table {
                        border: 0;
                        cellpadding: 2;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }

                    

                    td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        white-space: nowrap;
                    }

                    td.value {
                        font-size: 10.0pt;
                        font-family: Courier;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        white-space: nowrap;
                    }

                    .bordered {
                        border-bottom: .1pt solid windowtext;
                    }

                    span.bold {
                        font-size: 12.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                    }

                    span.value {
                        font-size: 12.0pt;
                        font-family: Courier;
                        color: windowtext;
                    }

                    div.page {
                        width: 210mm;
                        heifht: 297mm;
                        margin-top: 1pt;
                        margin-bottom: 1pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    p.bold {
                        font-weight: bold;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }
                    
                     .maingraph {
                        font-family: Arial;
                        font-size:12pt;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tbody>
                     <tr>
                        <td align="center" class="maingraph">
                           <b>Отчет по выявленным рискам</b>
                           <br/>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <b>Регистрационный номер ДТ: </b>
                           <xsl:value-of select="rrsk:DocID/rrsk:DTRegNum/cat_ru:CustomsCode"/>/<xsl:call-template name="gtd_date">
                              <xsl:with-param name="dategtd" select="rrsk:DocID/rrsk:DTRegNum/cat_ru:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="rrsk:DocID/rrsk:DTRegNum/rrsk:AddNumber"/><xsl:value-of select="rrsk:DocID/rrsk:DTRegNum/cat_ru:GTDNumber"/> 
								<br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table>
                  <tbody>
                     <tr>
                        <td>
                           <b>Выявленные риски:</b>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="width:210mm">
                  <tbody>
                     <xsl:for-each select="rrsk:RevealledRisks">
                        <tr>
                           <td align="center" style="width:100mm">
                              <b>ПР № (версия ПР)</b>
                           </td>
                           <td align="center" style="width:15mm">
                              <b>Номер товара по ДТ</b>
                           </td>
                           <td align="center" style="width:50mm">
                              <b>Решение по ПР</b>
                           </td>
                           <td align="center" style="width:40mm">
                              <b>Этап проведения проверки</b>
                           </td>
                           <td align="center" style="width:25mm">
                              <b>Инф. о применяемых программных средствах</b>
                           </td>
                        </tr>
                        <tr>
                           <!--ПР (Ориентировка) № (версия ПР)-->
                           <td align="center" style="width:100mm">
                           <xsl:choose>
								<xsl:when test="rrsk:TerrActionCode='11'">общероссийский профиль риска</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='12'">региональный профиль риска</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='13'">зональный профиль риска</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='20'">целевой профиль риска</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='21'">целевой правоохранительный профиль риска</xsl:when>
								<!--xsl:when test="rrsk:TerrActionCode='25'">общероссийская ориентировка</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='26'">региональная ориентировка</xsl:when-->
								<xsl:when test="rrsk:TerrActionCode='32'">профиль риска на основе моделей</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='55'">профиль риска, обязательный к применению</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='77'">профиль риска для идентификации категории уровня риска</xsl:when>
								<xsl:when test="rrsk:TerrActionCode='88'">зависимый профиль риска</xsl:when>
							</xsl:choose>
                               №
									<xsl:value-of select="rrsk:TerrActionCode"/>/
									<xsl:value-of select="rrsk:CustomsActionCode"/>/
									<xsl:call-template name="gtd_date">
										 <xsl:with-param name="dategtd" select="rrsk:RiskProfileRegDate"/>
									  </xsl:call-template>/
									<xsl:value-of select="rrsk:RiskProfileNumber"/>/
									<xsl:value-of select="rrsk:RiskProfileNumberVersion"/> <br/>
                              <xsl:if test="rrsk:CriteriionCode">
										Код критерия отнесения товаров, внешнеэкономических операций и лиц к группам риска:  
										<xsl:value-of select="rrsk:CriteriionCode"/>
										<br/>
                              </xsl:if>
                              <xsl:if test="rrsk:ActivityCode">
								Код направления деятельности подразделения, по направлению которого выявлен риск:<xsl:value-of select="rrsk:ActivityCode"/>
                              </xsl:if>
                              <xsl:if test="rrsk:FirstPointDate or rrsk:EndVerDate">
								  <br/>
								  Период действия версии ПР: 
								  <xsl:if test="rrsk:FirstPointDate">
								   c 
								   	<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rrsk:FirstPointDate"/>
									</xsl:call-template>
								  </xsl:if>
								  <xsl:if test="rrsk:EndVerDate">
									   по 
								   	<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rrsk:EndVerDate"/>
									</xsl:call-template>
								  </xsl:if>
                              </xsl:if>
                           </td>
                           <!--Номер товара по ДТ-->
                           <td align="center" style="width:15mm">
							  <xsl:text>№ </xsl:text><xsl:value-of select="rrsk:Consigment"/><br/> 
                              <xsl:choose>
                                 <xsl:when test="rrsk:GoodsNumeric='0'">Партия товаров</xsl:when>
                                 <xsl:otherwise>
                                    <xsl:value-of select="rrsk:GoodsNumeric"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <!--Решение по ПР-->
                           <td align="center" style="width:50mm">
                              <xsl:choose>
                                 <xsl:when test="rrsk:RiskProfileType='0'">автоматически выявленный риск, проставляется программным средством в автоматическом режиме</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='1'">самостоятельно выявленный риск, проставляется программным средством в автоматическом режиме при внесении должностным лицом таможенного поста новой записи (в том числе, при применении "рамочных" ПР  и ПР по информации правоохранительных подразделений)</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='2'">риск, выявленный в автоматизированном режиме, требует принятия окончательного решения должностным лицом таможенного поста</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='3'">риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск выявлен"</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='4'">риск, выявленный в автоматизированном режиме, по которому должностным лицом таможенного поста на основании проверки неформализованных индикаторов риска принято решение - "Риск не выявлен"</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='5'">резерв</xsl:when>
                                 <xsl:when test="rrsk:RiskProfileType='6'">профиль риска не применяется по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:when>
                                 <xsl:otherwise><xsl:value-of select="rrsk:RiskProfileType"/></xsl:otherwise>
                              </xsl:choose>
                           </td>
                           <!--Этап проведения проверки-->
                           <td align="center" style="width:40mm">
                              <xsl:if test="rrsk:PointCode">
											Этап:<xsl:value-of select="rrsk:PointCode"/> 
										</xsl:if>
                              <xsl:if test="rrsk:PointDate">
											Дата завершения проверки:
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="rrsk:PointDate"/>
                                 </xsl:call-template> 
										</xsl:if>
                              <xsl:if test="rrsk:PointTime">
											Время завершения проверки:<xsl:value-of select="rrsk:PointTime"/>
                              </xsl:if>
                           </td>
                           <!--Инф. о применяемых программных средствах-->
                           <td align="center" style="width:25mm">
                              <xsl:if test="rrsk:SoftKind">
                                 <xsl:value-of select="rrsk:SoftKind"/> 
										</xsl:if>
                              <xsl:if test="rrsk:SoftVersion">
                                 <xsl:value-of select="rrsk:SoftVersion"/> 
										</xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="5">
                              <b>Принятие решений по мере:</b>
                           </td>
                        </tr>
                        <xsl:for-each select="rrsk:RiskAction">
                           <tr>
                              <td class="graph" colspan="5">
                                 <span class="maingraph" style="font: bold;">
                                    <xsl:value-of select="position()"/>
                                 </span>
                                 <xsl:if test="rrsk:ActionCode">
									Код мер по минимизации рисков:<xsl:value-of select="rrsk:ActionCode"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:MainActionCode">
									Код главной меры по минимизации рисков:<xsl:value-of select="rrsk:MainActionCode"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="(rrsk:CustomsPersonName) or (rrsk:LNPID)">
									ФИО и  ЛНП должностного лица, принявшего меры по риску:
										<xsl:value-of select="rrsk:CustomsPersonName"/> 
										<xsl:value-of select="rrsk:LNPID"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:RiskActionDate">
									Дата принятия мер по риску:
										<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="rrsk:RiskActionDate"/>
                                    </xsl:call-template>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:RiskActionTime">
									Время принятия мер по риску:
										<xsl:value-of select="rrsk:RiskActionTime"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:CustomsCode">
									Код таможенного органа, принявшего меры по риску:<xsl:value-of select="rrsk:CustomsCode"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:ActionResultCode">
									Код результатов применения прямых мер:<xsl:value-of select="rrsk:ActionResultCode"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:MandatoryAction">
									Признак обязательности применения прямых мер:<xsl:value-of select="rrsk:MandatoryAction"/>
                                    <br/>
                                 </xsl:if>
                                 <!--<xsl:if test="rrsk:MandatoryActionCount">
									Порядковый номер прямой меры по минимизации рисков:
										<xsl:value-of select="rrsk:MandatoryActionCount"/>
												<br/>
											</xsl:if>-->
                                 <xsl:if test="rrsk:SystemActionIndicator">
									Признак применения мер по минимизации рисков (уровень системы): 
										<xsl:value-of select="rrsk:SystemActionIndicator"/>
                                    <xsl:choose>
                                       <xsl:when test="rrsk:SystemActionIndicator=' '"></xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='0'">мера не применяется согласно результатам случайной выборки</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='1'">мера должна быть применена согласно профилю риска;</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='2'">мера не применялась из-за несоответствия этапа, на котором была проведена проверка на наличие рисков, и этапа, на котором мера по минимизации рисков должна применяться согласно условиям профиля риска;</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='3'">резерв</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='4'">мера не применяется в связи с включением субъекта ВЭД в Перечень лиц, в отношении которых принято решение об определении степени выборочности применения мер по минимизации рисков, либо в связи с его отнесением в установленном порядке к категории низкого уровня риска</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='5'">мера не применяется в связи с неприменением главной меры</xsl:when>
                                       <xsl:when test="rrsk:SystemActionIndicator='6'">мера не применялась по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:when>
                                    </xsl:choose>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:PersonActionIndicator">
									Признак применения мер (уровень пользователя):
										<xsl:value-of select="rrsk:PersonActionIndicator"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:ActionFoundation">
									Обоснование причины неприменения меры:
									<xsl:choose>
										<xsl:when test="rrsk:ActionFoundation='00'">мера применялась (значение по умолчанию)</xsl:when>
										<xsl:when test="rrsk:ActionFoundation='02'">мера по минимизации риска не применяется в связи с невыявлением риска в результате проверки неформализованных индикаторов риска автоматизированного профиля риска (пункт 129 Инструкции)</xsl:when>
										<xsl:when test="rrsk:ActionFoundation='03'">мера по минимизации рисков не применялась по условиям профиля риска</xsl:when>
										<xsl:when test="rrsk:ActionFoundation='04'">мера по минимизации риска не применялась в силу объективных причин. либо применялась не в соответствии с характеристиками, определенными в профиле риска, либо не в полном объеме</xsl:when>
										<xsl:when test="rrsk:ActionFoundation='05'">мера не применялась согласно результатам случайной выборки</xsl:when>
										<xsl:otherwise><xsl:value-of select="rrsk:ActionFoundation"/></xsl:otherwise>
									</xsl:choose>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:NonActionCode">
									Код причины неприменения меры:
										<xsl:value-of select="rrsk:NonActionCode"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:AdministrativeInfraction">
									Номера статей КоАП или УК РФ, если заведено дело об АП:
									<xsl:for-each select="rrsk:AdministrativeInfraction">
                                       <xsl:value-of select="rrsk:KodeksPunkt"/>.
										<xsl:value-of select="rrsk:KodeksPartPunkt"/> 
										на этапе: <xsl:value-of select="rrsk:PointCode"/> 
										<xsl:if test="rrsk:InfractionNumber">номер дела: <xsl:value-of select="rrsk:InfractionNumber"/></xsl:if>
									</xsl:for-each>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:NumberDefinitions">
									Номер определения о возбуждении дела об АП (УД) по журналу учета:
										<xsl:value-of select="rrsk:NumberDefinitions/rrsk:CustomsCode"/>/
										<xsl:value-of select="rrsk:NumberDefinitions/rrsk:Number"/>/
										<xsl:value-of select="substring(rrsk:NumberDefinitions/rrsk:DateYear,1,4)"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:AddNonFormInfoAction">
									Дополнительная неформализованная информация - уровень меры:
										<xsl:for-each select="rrsk:AddNonFormInfoAction">
											<xsl:choose>
												<xsl:when test="rrsk:InformationCode='0'">Резерв</xsl:when>
												<xsl:when test="rrsk:InformationCode='1'">Описание причины неприменения меры в силу объективных причин, применения не в соответствии с характеристиками, определенными в профиле риска, либо не в полном объеме</xsl:when>
												<xsl:when test="rrsk:InformationCode='2'">Отметка о результатах применения мер</xsl:when>
												<xsl:otherwise><xsl:value-of select="rrsk:InformationCode"/></xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="rrsk:ViolationsCode"/> 
											<xsl:for-each select="rrsk:TypicalName">
												<xsl:value-of select="."/> 
											</xsl:for-each>
                                       <xsl:value-of select="rrsk:PointCode"/>
                                       <br/>
                                    </xsl:for-each>
                                 </xsl:if>
                                 <xsl:if test="rrsk:Coordination">
									Признак согласования начальником поста в рамках применения ММР 623:
									<xsl:choose>
										<xsl:when test="rrsk:Coordination='1' or rrsk:Coordination='true' or rrsk:Coordination='t' or rrsk:Coordination='TRUE'">Есть</xsl:when>
										<xsl:otherwise>Нет</xsl:otherwise>
									</xsl:choose>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="rrsk:ActionResult">Сведения о результате применения меры в случае достижения результатов при повторном декларировании:<br/>
                                    <xsl:for-each select="rrsk:ActionResult">
                                       <xsl:if test="rrsk:GTDIDNew">
											-регистрационный номер вновь поданной ДТ:
											<xsl:value-of select="rrsk:GTDIDNew/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                             <xsl:with-param name="dateIn" select="rrsk:GTDIDNew/cat_ru:RegistrationDate"/>
                                          </xsl:call-template>/<xsl:value-of select="rrsk:GTDIDNew/cat_ru:GTDNumber"/>
                                       </xsl:if>
                                       <xsl:if test="rrsk:NewGoodsNumeric">
                                          <br/>
											-номер товара по вновь поданной ДТ:
											<xsl:value-of select="rrsk:NewGoodsNumeric"/>
                                       </xsl:if>
                                       <xsl:if test="rrsk:KodeksPunkt">
                                          <br/>
											-номер статьи Кодекса Российской Федерации об административных правонарушениях (КоАП России) или Уголовного кодекса России (УК России):
											<xsl:value-of select="rrsk:KodeksPunkt"/>
                                       </xsl:if>
                                       <xsl:if test="rrsk:KodeksPartPunkt">
                                          <br/>
											-номер части статьи КоАП России или УК России:
											<xsl:value-of select="rrsk:KodeksPartPunkt"/>
                                       </xsl:if>
                                       <xsl:if test="rrsk:InfractionNumber">
										   <br/>
										   -номер дела: 
										   <xsl:value-of select="rrsk:InfractionNumber"/>
										</xsl:if>
                                       <xsl:if test="rrsk:ActionResultCode">
										   <br/>
										   -код результата применения меры по минимизации риска:
										   <xsl:value-of select="rrsk:ActionResultCode"/>
                                       </xsl:if>
                                       <br/>
                                    </xsl:for-each>
                                 </xsl:if>
                              </td>
                           </tr>
                           <!--</xsl:for-each>-->
                           <xsl:if test="rrsk:InspectionCharacter">
                              <tr>
                                 <td colspan="5">
											Характеристики досмотра/осмотра:
										</td>
                              </tr>
                              <xsl:for-each select="rrsk:InspectionCharacter">
                                 <tr>
                                    <td class="graph" colspan="5">
                                       <xsl:if test="rrsk:InspCharCode">	
									Код характеристики досмотра/осмотра:
									
									<xsl:value-of select="rrsk:InspCharCode"/>; </xsl:if>
									Значение характеристики досмотра/осмотра:
									<xsl:value-of select="rrsk:InspCharValue"/>; 
									<xsl:choose>
                                          <xsl:when test="rrsk:CodeChoiceIndicator='0'">0 - возможно выбирать значения характеристик таможенного досмотра</xsl:when>
                                          <xsl:when test="rrsk:CodeChoiceIndicator='1'">1 - возможность выбора отсутствует (досмотр применяется в соответствии со значениями характеристик, установленных профилем риска)</xsl:when>
                                       </xsl:choose>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </xsl:if>
                        </xsl:for-each>
                        <xsl:if test="rrsk:AddNonFormInfoRiskProfile">
                           <tr>
                              <td colspan="5">
                                 <b>Дополнительная неформализованная информация:</b>
                              </td>
                           </tr>
                           <xsl:for-each select="rrsk:AddNonFormInfoRiskProfile">
                              <tr>
                                 <td colspan="5">
									Код информации:
								    <xsl:choose>
										<xsl:when test="rrsk:InformationCode='5'">5 - Применение мер по минимизации рисков по самостоятельному решению должностного лица</xsl:when>
										<xsl:when test="rrsk:InformationCode='7'">7 - Применение мер на основании профилей риска по информации правоохранительных подразделений</xsl:when>
										<xsl:when test="rrsk:InformationCode='8'">8 - Применение мер по минимизации рисков на основании профиля риска № 11/10000/10062011/01900 и его последующих актуализированных версий</xsl:when>
										<xsl:when test="rrsk:InformationCode='9'">9 - Применение мер по минимизации рисков на основании профиля риска № 11/10000/24092008/00340 и его последующих актуализированных версий</xsl:when>
										<xsl:otherwise><xsl:value-of select="rrsk:InformationCode"/></xsl:otherwise>
									</xsl:choose>
									Обоснование мер:
									<xsl:for-each select="rrsk:TypicalName">
                                       <xsl:value-of select="."/> 
									</xsl:for-each>
									Этап проведения:
									<xsl:value-of select="rrsk:PointCode"/> 
								 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:if>
                     </xsl:for-each>
                  </tbody>
               </table>
                <xsl:if test="rrsk:AddResultRiskProfile">
                  <table>
                     <tbody>
                        <tr>
                           <td>
                              <br/>
                              <b>Дополнительные результаты применения мер по минимизации рисков:</b>
                              <br/>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="1" style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="center">ПР (Ориентировка) № (версия ПР)</td>
                           <td align="center">Номер товара</td>
                           <td align="center">Сумма,<br/>подлежащая взысканию (возврату), руб.</td>
                        </tr>
                        <xsl:for-each select="rrsk:AddResultRiskProfile">
                           <tr>
                              <!--ПР (Ориентировка) № (версия ПР)-->
                              <td align="center">
								<xsl:choose>
									<xsl:when test="rrsk:TerrActionCode='11'">общероссийский профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='12'">региональный профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='13'">зональный профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='20'">целевой профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='21'">целевой правоохранительный профиль риска</xsl:when>
									<!--xsl:when test="rrsk:TerrActionCode='25'">общероссийская ориентировка</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='26'">региональная ориентировка</xsl:when-->
									<xsl:when test="rrsk:TerrActionCode='32'">профиль риска на основе моделей</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='55'">профиль риска, обязательный к применению</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='77'">профиль риска для идентификации категории уровня риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='88'">зависимый профиль риска</xsl:when>
								</xsl:choose>
                                 №
									<xsl:value-of select="rrsk:TerrActionCode"/>/
									<xsl:value-of select="rrsk:CustomsActionCode"/>/
									<xsl:call-template name="gtd_date">
                                    <xsl:with-param name="dategtd" select="rrsk:RiskProfileRegDate"/>
                                 </xsl:call-template>/
									<xsl:value-of select="rrsk:RiskProfileNumber"/>/
									<xsl:value-of select="rrsk:RiskProfileNumberVersion"/> <br/>
                              </td>
                              <!--Номер товара по ДТ-->
                              <td align="center">
                                    <xsl:value-of select="rrsk:DTGoodsNumeric"/>
                              </td>
                              <!--Сумма, подлежащая взысканию (возврату)-->
                              <td align="center">
									<xsl:value-of select="rrsk:ChangeAmount"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>            
               <xsl:if test="rrsk:RiskInf">
                  <table>
                     <tbody>
                        <tr>
                           <td>
                              <br/>
                              <b>Обоснование применения мер по минимизации рисков:</b>
                              <br/>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <table border="1" style="width:210mm">
                     <tbody>
                        <tr>
                           <td align="center">ПР (Ориентировка) № (версия ПР)</td>
                           <td align="center">Номер товара</td>
                           <td align="center">Решение по мере  и обоснование</td>
                        </tr>
                        <xsl:for-each select="rrsk:RiskInf">
                           <tr>
                              <!--ПР (Ориентировка) № (версия ПР)-->
                              <td align="center">
                                <xsl:choose>
									<xsl:when test="rrsk:TerrActionCode='11'">общероссийский профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='12'">региональный профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='13'">зональный профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='20'">целевой профиль риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='21'">целевой правоохранительный профиль риска</xsl:when>
									<!--xsl:when test="rrsk:TerrActionCode='25'">общероссийская ориентировка</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='26'">региональная ориентировка</xsl:when-->
									<xsl:when test="rrsk:TerrActionCode='32'">профиль риска на основе моделей</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='55'">профиль риска, обязательный к применению</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='77'">профиль риска для идентификации категории уровня риска</xsl:when>
									<xsl:when test="rrsk:TerrActionCode='88'">зависимый профиль риска</xsl:when>
								</xsl:choose>
                                  №
									<xsl:value-of select="rrsk:TerrActionCode"/>/
									<xsl:value-of select="rrsk:CustomsActionCode"/>/
									<xsl:call-template name="gtd_date">
                                    <xsl:with-param name="dategtd" select="rrsk:RiskProfileRegDate"/>
                                 </xsl:call-template>/
									<xsl:value-of select="rrsk:RiskProfileNumber"/>/
									<xsl:value-of select="rrsk:RiskProfileNumberVersion"/> <br/>
                              </td>
                              <!--Номер товара по ДТ-->
                              <td align="center">
                                 <xsl:choose>
                                    <xsl:when test="rrsk:GoodsNumeric='0'">Партия товаров</xsl:when>
                                    <xsl:otherwise>
                                       <xsl:value-of select="rrsk:GoodsNumeric"/>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                              <!--Решение по мере  и обоснование-->
                              <td align="center">
										Код информации:
										<xsl:choose>
											<xsl:when test="rrsk:InformationCode='4'">4 - Применение мер по минимизации рисков на основании "рамочных" профилей риска ,  по собственному решению</xsl:when>
											<xsl:when test="rrsk:InformationCode='7'">7 - Применение мер на основании профилей риска по информации правоохранительных подразделений</xsl:when>
											<xsl:otherwise><xsl:value-of select="rrsk:InformationCode"/></xsl:otherwise>
										</xsl:choose>
										<br/>
										Обоснование применения мер:
										<xsl:for-each select="rrsk:TypicalName">
											<xsl:value-of select="."/> 
										</xsl:for-each>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
