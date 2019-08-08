<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ivtin="urn:customs.ru:Information:CustomsDocuments:InventoryIn:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Опись документов. Внутренний формат.</title>
            <style type="text/css">
					body {
					    text-align: left;
					    background: #cccccc;
					}
					div.pagePortrait {
					    width: 210mm;
					    margin-top: 10pt;
					    margin-bottom: 10pt;
					    margin-left: auto;
					    margin-right: auto;
					    padding: 10mm;
					    padding-left: 10mm;
					    background: #ffffff;
					    border: solid .5pt #000000;
					    text-align: left;
					}
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {
                        div.pagePortrait {border: none; margin: 0; padding: 0;}
                    }
					table.items {
					    border: none;
					    border-collapse: collapse;
					    emptyCells: show;
					    font-family: Arial;
					    font-size: 8pt;
					}
					.items th {
					    background: #F0F0F0;
					    vertical-align: middle;
					    font-weight: bold;
					}
					.items td, th {
					    border: solid 1px black;
					    padding: 3px;
					    vertical-align: top;
					}
					.items td.blank {
					    border: none;
					    width: 4pt;
					}
					.items td.grey {
					    border: none;
					    background: #F0F0F0;
					    border-right: 1px solid black;
					}
					h2 {
					    text-align: center;
					}
					h3 {
					    text-align: left;
					}
					.bold {
					    font-weight: bold;
					}
					table {
					    border: none;
					    vertical-align: top;
					}
					td {
					    vertical-align: top;
					}
					td.graph, td.items .graph {
					    border : none;
					    font-size: 7pt;
					    text-align: center;
					    padding: 0;
					    spacing: 0;
					    white-space: normal;
					}
					.fieldValue	{
						font-weight: bold;
					}
					th {
					    text-align: center;
					}</style>
         </head>
         <body>
            <div class="pagePortrait">
               <xsl:apply-templates select="ivtin:InventoryIn"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <!-- Опись документов. Внутренний формат -->
   <xsl:template match="ivtin:InventoryIn">
      <h2>Опись документов № <xsl:value-of select="cat_ru:DocumentID"/>
      </h2>
      <h3>Информация о ДТ</h3>
      <span class="fieldValue">Номер ДТ: </span>
      <xsl:apply-templates select="ivtin:GTDNumber"/>
      <br/>
      <span class="fieldValue">Количество описей к ДТ: </span>
      <xsl:value-of select="ivtin:NumberOfInvent"/>
      <br/>
      <h3>Сведения о лице, подающем ДТ</h3>
      <span class="fieldValue">Наименование: </span>
      <xsl:value-of select="ivtin:GTDPerson/cat_ru:OrganizationName"/>
      <span class="fieldValue"> (</span>
      <xsl:value-of select="ivtin:GTDPerson/cat_ru:ShortName"/>
      <span class="fieldValue">) </span>
      <xsl:if test="ivtin:GTDPerson/ivtin:BranchOrganizationName">
         <br/>
         <span class="fieldValue">Обособленное подразделение: </span>
         <xsl:value-of select="ivtin:GTDPerson/ivtin:BranchOrganizationName"/>
      </xsl:if>
      <br/>
      <xsl:if test="ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
         <span class="fieldValue"> ОГРН: </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="ivtin:GTDPerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
         <span class="fieldValue"> УНП: </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
      </xsl:if>
      <xsl:if test="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
         <span class="fieldValue"> БИН: </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
      </xsl:if>
      <xsl:if test="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
         <span class="fieldValue"> ИИН: </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
      </xsl:if>
      <xsl:if test="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode">
         <span class="fieldValue"> ИТН: </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode | ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode | ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN |  ivtin:GTDPerson/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv "/>
      </xsl:if>
      <xsl:if test="(ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN) or (ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
         <span class="fieldValue"> ИНН/КПП </span>
         <xsl:value-of select="ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
         <xsl:if test="ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <xsl:text>/</xsl:text>
            <xsl:value-of select="ivtin:GTDPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         </xsl:if>
      </xsl:if>
      <xsl:apply-templates select="ivtin:InventoryInstance"/>
      <xsl:apply-templates select="ivtin:InventOfficialMark"/>
      <xsl:if test="ivtin:Request">
         <xsl:apply-templates select="ivtin:Request"/>
      </xsl:if>
   </xsl:template>
   <!--Шаблон для отображения информации об организации в одну строку
	<xsl:template name="Organisation_short">
		<xsl:param name="base"/>
		<xsl:value-of select="$base/cat_ru:OrganizationName"/>
		<xsl:if test="$base/cat_ru:ShortName">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="$base/cat_ru:ShortName"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN or $base/cat_ru:RFOrganizationFeatures/cat_ru:INN or $base/cat_ru:RFOrganizationFeatures/cat_ru:KPP or $base/cat_ru:RBOrganizationFeatures/cat_ru:UNP or $base/cat_ru:RKOrganizationFeatures/cat_ru:BIN or $base/cat_ru:RKOrganizationFeatures/cat_ru:IIN or $base/cat_ru:RKOrganizationFeatures/cat_ru:ITN ">
			<br/>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"> ИНН: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/></xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"> КПП: <xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/></xsl:if>
		</xsl:if>
		<xsl:if test="$base/cat_ru:RBOrganizationFeatures/cat_ru:UNP">УПН: <xsl:value-of select="$base/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/></xsl:if>
			<xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:BIN"> BIN: <xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/></xsl:if>
			<xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:IIN"> IIN: <xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/></xsl:if>
			<xsl:if test="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN">ITN: <xsl:value-of select="$base/cat_ru:RKOrganizationFeatures/cat_ru:ITN"/></xsl:if>
		</xsl:template>
	 Экземпляр описи-->
   <xsl:template match="ivtin:InventoryInstance">
      <xsl:apply-templates select="ivtin:InventoryInstancePerson"/>
      <h3>Документы описи</h3>
      <table class="items">
         <tbody>
            <tr>
                <th>Порядковый номер ЭПДТ в последовательности ЭПДТ</th>
               <th style="width:10mm;">Код вида документа</th>
               <th style="width:50mm;">Вид, номер и дата составления документа</th>
               <th style="width:10mm;">Оригинал / копия</th>
               <th style="width:20mm;">Количество листов / экземпляров</th>
               <th style="width:65mm;">Примечание (в том числе справочный номер ДТ)</th>
               <th style="width:65mm;">Запрос, по которому предоставляется документ/Признак результата запроса</th>
               <th style="width:20mm;">Способ подачи документа</th>
               <th style="width:20mm;">Способ представления документа</th>
               <th>Признак последовательности ЭПДТ</th>
            </tr>
            <xsl:apply-templates select="ivtin:InventDocument"/>
         </tbody>
      </table>
      <xsl:if test="ivtin:InventoryInstanceMark">
         <span class="fieldValue">Служебные отметки в экземпляре описи: </span>
			дата принятия описи
				<xsl:call-template name="date">
            <xsl:with-param name="text" select="ivtin:InventoryInstanceMark/ivtin:InventoryInstanceDate"/>
         </xsl:call-template>
         <xsl:if test="ivtin:InventoryInstanceMark/ivtin:LNP">, 
				<span class="fieldValue">ЛНП должностного лица, принявшего документы </span>
            <xsl:value-of select="ivtin:InventoryInstanceMark/ivtin:LNP"/>
         </xsl:if>
      </xsl:if>
      <br/>
      <xsl:if test="ivtin:PriorInformation">
         <span class="fieldValue">Сведения о предоставленной предварительной информации:</span>
         <br/>
      </xsl:if>
      <xsl:apply-templates select="ivtin:PriorInformation"/>
   </xsl:template>
   <!-- ДТ -->
   <xsl:template match="ivtin:GTDNumber | ivtin:PrevGTDNumber">
      <xsl:value-of select="cat_ru:CustomsCode"/>
      <xsl:text>/</xsl:text>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="cat_ru:RegistrationDate"/>
      </xsl:call-template>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <!--Сведения о лице, подающем опись-->
   <xsl:template match="ivtin:InventoryInstancePerson">
      <h3>Сведения о лице, подающем опись <xsl:value-of select="../ivtin:InstanceNumber"/>
      </h3>
      <span class="fieldValue">ФИО и должность: </span>
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="ivtin:IdentityCard"/>
      <br/>
      <xsl:apply-templates select="ivtin:AuthoritesDocument"/>
      <br/>
   </xsl:template>
   <!-- Документ из описи-->
   <xsl:template match="ivtin:InventDocument">
      <tr>
         <td align="center" class="value">
         <xsl:if test="ivtin:SerialNumber">
            <xsl:value-of select="ivtin:SerialNumber"/>
         </xsl:if>
         </td>
         <td align="center" class="value">
            <xsl:value-of select="ivtin:InvDocCode"/>
         </td>
         <td class="value">
            <xsl:value-of select="ivtin:InvDocName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="ivtin:InvDocNumber"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="date">
               <xsl:with-param name="text" select="ivtin:InvDocDate"/>
            </xsl:call-template>
         </td>
         <td align="center" class="value">
            <!--xsl:choose>
               <xsl:when test="ivtin:InvDocPresentation">
                  <xsl:value-of select="ivtin:InvDocPresentation"/>
               </xsl:when>
               <xsl:otherwise-->
                  <xsl:text> </xsl:text>
               <!--/xsl:otherwise>
            </xsl:choose-->
         </td>
         <td align="center" class="value">
            <xsl:choose>
               <xsl:when test="ivtin:InvDocLists or ivtin:InvDocCopies">
                  <xsl:value-of select="ivtin:InvDocLists"/>
                  <xsl:if test="ivtin:InvDocCopies">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="ivtin:InvDocCopies"/>
                  </xsl:if>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text> </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </td>
         <td class="value">
            <xsl:if test="ivtin:Note">
               <xsl:value-of select="ivtin:Note"/>
               <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="ivtin:PrevGTDNumber">
               <xsl:apply-templates select="ivtin:PrevGTDNumber"/>
            </xsl:if>
            <xsl:if test="ivtin:SerialNumberSign='1' or ivtin:SerialNumberSign='t' or ivtin:SerialNumberSign='true'">
               <br/>
            Данный ЭПДТ является последним в последовательности <xsl:if test="ivtin:SerialNumber">№<xsl:value-of select="ivtin:SerialNumber"/>
               </xsl:if>
            </xsl:if>
            <xsl:if test="ivtin:SerialNumberSign='0' or ivtin:SerialNumberSign='f' or ivtin:SerialNumberSign='false'">
               <br/>
            Данный ЭПДТ не является последним в последовательности <xsl:if test="ivtin:SerialNumber">№<xsl:value-of select="ivtin:SerialNumber"/>
               </xsl:if>
            </xsl:if>
         </td>
         <td class="value">
            <xsl:if test="ivtin:RequestDescription"> 
					запрос номер <xsl:value-of select="ivtin:RequestDescription/ivtin:RequestNumber"/>
               <xsl:if test="ivtin:RequestDescription/ivtin:RequestDate"> 
						от <xsl:call-template name="date">
                     <xsl:with-param name="text" select="ivtin:RequestDescription/ivtin:RequestDate"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:if>
            <xsl:if test="ivtin:IndicatorPresent">
				<xsl:text> / </xsl:text>
				<xsl:choose>
					<xsl:when test="ivtin:IndicatorPresent='0'">запрос отправлен, ответ не получен</xsl:when>
					<xsl:when test="ivtin:IndicatorPresent='1'">запрошенный документ получен</xsl:when>
					<xsl:when test="ivtin:IndicatorPresent='2'">запрошенный документ не получен (для ФОИВ)</xsl:when>
					<xsl:when test="ivtin:IndicatorPresent='3'">получено сообщение об ошибке (для ФОИВ)</xsl:when>
				</xsl:choose>
            </xsl:if>
            <xsl:text> </xsl:text>
         </td>
         <td class="value">
            <xsl:choose>
               <xsl:when test="(ivtin:DocumentFormSign='true') or (ivtin:DocumentFormSign='t') or (ivtin:DocumentFormSign='1')">в виде бумажного документа</xsl:when>
               <xsl:otherwise>в электронной форме</xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
         </td>
         <td class="value">
            <xsl:choose>
               <xsl:when test="(ivtin:PresentDocumentType='true') or (ivtin:PresentDocumentType='t') or (ivtin:PresentDocumentType='1')">в формализованном виде</xsl:when>
               <xsl:otherwise>в произвольном виде</xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
         </td>
         <td class="value">
             <xsl:choose>
               <xsl:when test="(ivtin:SerialNumberSign='true') or (ivtin:SerialNumberSign='t') or (ivtin:SerialNumberSign='1')">Документ является последним в последовательности</xsl:when>
               <xsl:otherwise>Документ не является последним в последовательности</xsl:otherwise>
            </xsl:choose>
         </td>
      </tr>
   </xsl:template>
   <!-- Запрос о представлении дополнительных документов -->
   <xsl:template match="ivtin:Request">
      <h3>Запрос о представлении дополнительных документов № <xsl:value-of select="ivtin:RequestNumber"/>
         <xsl:text> от </xsl:text>
         <xsl:call-template name="date">
            <xsl:with-param name="text" select="ivtin:RequestDate"/>
         </xsl:call-template>
      </h3> Код таможенного органа: <xsl:value-of select="ivtin:CustomsCode"/>
      <br/>
      <xsl:if test="ivtin:GTDNumber">
         <span class="fieldValue">Номер ДТ: </span>
         <xsl:apply-templates select="ivtin:GTDNumber"/>
         <br/>
      </xsl:if>
      <span class="fieldValue">Запрос направлен: </span>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="ivtin:SendDate"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="ivtin:CustomsPerson"/>
      <br/>
      <span class="fieldValue">Запрос получен: </span>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="ivtin:ReceiveDate"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="ivtin:PersonName"/>
      <br/>
      <span class="fieldValue">Срок представления документов: </span>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="ivtin:SubmitDate"/>
      </xsl:call-template>
      <br/>
      <xsl:if test="ivtin:Address">
         <span class="fieldValue">Адрес: </span>
         <xsl:apply-templates mode="CommaSeparated" select="ivtin:Address/*"/>
         <br/>
      </xsl:if>
      <span class="fieldValue">Средства связи: </span>
      <xsl:apply-templates select="ivtin:Communication"/>
      <br/>
      <br/>
      <table class="items" width="100%">
         <tr>
            <th align="left" colspan="5"> Запрошенные документы </th>
         </tr>
         <tr>
            <th>Номер записи</th>
            <th>Код и вида документа</th>
            <th>ФИО должностного лица</th>
            <th>Цель запроса</th>
            <th>Примечание</th>
         </tr>
         <xsl:apply-templates select="ivtin:RequestDocument"/>
      </table>
   </xsl:template>
   <!--Вывод значений элементов через запятую-->
   <xsl:template match="*" mode="CommaSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
   </xsl:template>
   <!--Средство связи	"1"-телефон, "2"-факс, "3"-телекс, "4"-телеграф, "5"-e-mail, "6"-почта	-->
   <xsl:template match="ivtin:Communication">
      <xsl:if test="string(ivtin:CommCode)='1'">Телефон: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='2'">Факс: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='3'">Телекс: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='4'">Телеграф: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='5'">E-mail: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='6'">Почта: <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:if test="string(ivtin:CommCode)='7'">В ходе электронного представления сведений</xsl:if>
      <xsl:value-of select="ivtin:CommNumber"/>
      <xsl:text> </xsl:text>
   </xsl:template>
   <!--Документ, подтверждающий полномочия лица, присутствующего при осмотре-->
   <xsl:template match="ivtin:AuthoritesDocument">
      <span class="fieldValue">Документ, подтверждающий полномочия: </span>
      <xsl:value-of select="cat_ru:PrDocumentName"/>, 
		<span class="fieldValue">номер: </span>
      <xsl:value-of select="cat_ru:PrDocumentNumber"/>, 
		<span class="fieldValue">дата выдачи: </span>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
      </xsl:call-template>
      <xsl:if test="cat_ru:ComplationAuthorityDate">, 
			<span class="fieldValue">дата окончания: </span>
         <xsl:call-template name="date">
            <xsl:with-param name="text" select="cat_ru:ComplationAuthorityDate"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <!--Документ, подтверждающий личность-->
   <xsl:template match="ivtin:IdentityCard">
      <span class="fieldValue">Документ, удостоверяющий личность: Код </span>
      <xsl:value-of select="cat_ru:IdentityCardCode"/>
      <xsl:text>,  </xsl:text>
      <span class="fieldValue">наименование документа </span>
      <xsl:value-of select="cat_ru:IdentityCardName"/>
      <xsl:if test="cat_ru:IdentityCardSeries">
         <xsl:text>,  </xsl:text>
         <span class="fieldValue">серия </span>
         <xsl:value-of select="cat_ru:IdentityCardSeries"/>
         <xsl:text>,  </xsl:text>
      </xsl:if>
      <span class="fieldValue">номер </span>
      <xsl:value-of select="cat_ru:IdentityCardNumber"/>
      <xsl:text>,  </xsl:text>
      <span class="fieldValue">выдан </span>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="cat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:if test="cat_ru:OrganizationName">
         <xsl:text> </xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
   <!--Сведения о предоставленной предварительной информации -->
   <xsl:template match="ivtin:PriorInformation">
      <ul>
         <xsl:for-each select="ivtin:PriorInformationID">
            <li>
               <xsl:value-of select="."/>
            </li>
         </xsl:for-each>
      </ul>
   </xsl:template>
   <!--Отметки таможенного органа-->
   <xsl:template match="ivtin:InventOfficialMark">
      <h3>Отметки таможенного органа</h3>
      <xsl:if test="ivtin:GTDAcceptTime">
         <span class="fieldValue">Время принятия ДТ: </span>
         <xsl:value-of select="ivtin:GTDAcceptTime"/>
         <br/>
      </xsl:if>
      <xsl:if test="ivtin:ExaminationStartDate">
         <span class="fieldValue">Дата и время начала проверки ДТ: </span>
         <xsl:call-template name="date">
            <xsl:with-param name="text" select="ivtin:ExaminationStartDate"/>
         </xsl:call-template>
         <xsl:text> </xsl:text>
         <xsl:value-of select="ivtin:ExaminationStartTime"/>
         <br/>
      </xsl:if>
      <xsl:if test="ivtin:LNP">
         <span class="fieldValue">ЛНП лица, сделавшего отметку о начале проверки ДТ: </span>
         <xsl:value-of select="ivtin:LNP"/>
         <br/>
      </xsl:if>
      <xsl:if test="ivtin:GTDDecisionCode">
         <span class="fieldValue">Код решения по ДТ: </span>
         <xsl:value-of select="ivtin:GTDDecisionCode"/>
         <br/>
      </xsl:if>
      <xsl:if test="ivtin:GTDDecisionDate">
         <span class="fieldValue">Дата и время решения по ДТ: </span>
         <xsl:call-template name="date">
            <xsl:with-param name="text" select="ivtin:GTDDecisionDate"/>
         </xsl:call-template>
         <xsl:text> </xsl:text>
         <xsl:value-of select="ivtin:GTDDecisionTime"/>
         <br/>
      </xsl:if>
      <xsl:if test="ivtin:DecisionReason">
         <span class="fieldValue">Причина отказа в принятии ДТ: </span>
         <xsl:value-of select="ivtin:DecisionReason"/>
      </xsl:if>
   </xsl:template>
   <!--Запрошенный документ-->
   <xsl:template match="ivtin:RequestDocument">
      <tr>
         <td align="center">
            <xsl:value-of select="ivtin:RecordNumber"/>
         </td>
         <td>
            <xsl:value-of select="ivtin:InvDocCode"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="ivtin:InvDocName"/>
         </td>
         <td>
            <xsl:value-of select="ivtin:RequestorName"/>
         </td>
         <td>
            <xsl:value-of select="ivtin:ReqPurpose"/>
         </td>
         <td>
            <xsl:value-of select="ivtin:Note"/>
         </td>
      </tr>
   </xsl:template>
   <!--Отображения даты по стандартам русской локали-->
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!--Вывод информации о должностном лице-->
   <xsl:template match="ivtin:CustomsPerson">
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:if test="cat_ru:LNP">
         <xsl:text> (</xsl:text>
         <xsl:value-of select="cat_ru:LNP"/>
         <xsl:text>)</xsl:text>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
