<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:racm="urn:customs.ru:Information:CustomsDocuments:RepresApplicCustomsMark:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="racm:RepresApplicCustomsMark">
    <html>
      <head>
        <title>Таможенные отметки Заявления таможенного представителя</title>
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
          font-size: 8pt;
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
          .р{

          <!--text-orientation: sideways-right;-->
          -webkit-transform: rotate(180deg);
          -moz-transform: rotate(180deg);
          -o-transform: rotate(180deg);
          transform: rotate(180deg);
          filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
          }
          .graph1 {
          font-family: Arial;
          font-size: 7pt;
          }
          .parent {
          margin: 0%;
          }
        </style>
      </head>
      <body>
        <div class="album_page">
          <table border="0" width="180mm">
            <tr>
              <td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
                <font face="Times new roman" size="3">
                  <b>
                    РЕЕСТР ТОВАРОВ ДЛЯ ЛИЧНОГО ПОЛЬЗОВАНИЯ,<br/> ДОСТАВЛЯЕМЫХ ЭКСПРЕСС-ПЕРЕВОЗЧИКОМ В АДРЕС ФИЗИЧЕСКИХ ЛИЦ<br/>№
                    <u>
                      <xsl:value-of select="racm:ApplicationRegNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                        <xsl:with-param name="dateIn" select="racm:ApplicationRegNumber/cat_ru:RegistrationDate"/>
                      </xsl:call-template>/<xsl:value-of select="racm:ApplicationRegNumber/cat_ru:GTDNumber"/>
                    </u>
                  </b>
                </font>
              </td>
            </tr>
          </table>
          <br/><br/>
          <!--table>
            <tr>
              <td class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;"> </td>
            </tr>
          </table>
          <div align="center">
            <span class="graph">
              (наименование таможенного представителя, ИНН, ОКПО, № документа, подтверждающего включение юридического лица в реестр таможенных представителей)
            </span>
          </div-->
          <table>
            <tr>
              <td align="center" rowspan="2">
                <span class="graph">
                  № <br/>п/п
                </span>
              </td>
              <td align="center" colspan="3" width="15%">
                <span class="graph">Сведения о декларируемых товарах</span>
              </td>
              <td align="center" rowspan="2" width="7%">
                <span class="graph">№ ТПО</span>
              </td>
              <td align="center" rowspan="2" width="15%">
                <span class="graph">Получатель</span>
              </td>
              <td rowspan="2" width="15%">
                <span class="graph">
                  Отметка таможенного<br/>органа о принятом<br/>решении в отношении<br/>выпуска товаров
                </span>
              </td>
              <td align="center" rowspan="2" width="14%">
                <span class="graph">
                  Основа начисления
                </span>
              </td>
            </tr>
            <tr>
			  <td align="center">
                <span class="graph">
                  Номер<br/>индивидуальной<br/>накладной
                </span>
              </td>
              <td align="center">
                <span class="graph">Наименование товара</span>
              </td>
              <td align="center">
                <span class="graph">
                  Код то<br/>вара<br/>по ТН<br/>ВЭД<br/>ЕАЭС
                </span>
              </td>
            </tr>
            <tr>
              <td align="center">
                <span class="graph">1</span>
              </td>
              <td align="center" width="15%">
                <span class="graph">2</span>
              </td>
              <td align="center" width="33%">
                <span class="graph">3</span>
              </td>
              <td align="center" width="7%">
                <span class="graph">4</span>
              </td>
              <td align="center" width="7%">
                <span class="graph">5</span>
              </td>
              <td align="center" width="15%">
                <span class="graph">6</span>
              </td>
              <td align="center" width="15%">
                <span class="graph">7</span>
              </td>
              <td align="center" width="14%">
                <span class="graph">8</span>
              </td>
            </tr>
            <xsl:for-each select="racm:Consignment">
              <tr>
                <td align="center">
                  <span class="graph">
                    <!--<xsl:choose>
                      <xsl:when test="racm:ListNumeric">
                        <xsl:value-of select="racm:ListNumeric"/>
                      </xsl:when>
                      <xsl:otherwise>-->
                    <xsl:number format="1." value="position()"/>
                    <!--</xsl:otherwise>
                    </xsl:choose>-->
                  </span>
                </td>
                <td class="parent" colspan="3" style="padding:0;">
                  <table style="margin:0;">
                    <xsl:for-each select="racm:ConsignmentGroup">
                      <tr>
						<td align="center" width="27%" style="border-top:0px solid #ffffff; border-left:0px solid #ffffff;" >
						  <span class="graph">
							<xsl:for-each select="racm:IndividualWayBill">
							  <xsl:if test="cat_ru:PrDocumentNumber">
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
							  </xsl:if>
							  <xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						  </span>
						</td>
						<td style="border:0px solid white; border-bottom:1px solid gray;">
							<table>
								<tbody>
									<xsl:for-each select="racm:Goods">
										<tr>
											<td style="border:0px solid white;border-right:1px solid gray" width="83%">
											  <span class="graph">
												<xsl:value-of select="position()"/>.
												<xsl:for-each select="racm:GoodsDescription">
												  <xsl:value-of select="."/> 
												</xsl:for-each>
											  </span>
											</td>
											<td style="border:0px solid white" width="17%">
											  <span class="graph">
												<xsl:if test="racm:GoodsTNVEDCode">
												  <xsl:value-of select="racm:GoodsTNVEDCode"/>
												</xsl:if>
											  </span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </td>
                <td style="border-left:0px solid #ffffff;" width="7%">
                  <span class="graph">
                    <xsl:if test="racm:TPOInfo/cat_ru:PrDocumentNumber">
                      №<xsl:value-of select="racm:TPOInfo/cat_ru:PrDocumentNumber"/>
                    </xsl:if>
                  </span>
                </td>
                <td class="parent" width="15%">
                  <table>
                    <xsl:for-each select="racm:Consignee">
                      <tr>
                        <td class="graph" style="border-top:0px solid #ffffff; border-bottom:0px solid #ffffff; border-right:0px solid #ffffff; border-left:0px solid #ffffff;" width="165mm">
                          <xsl:if test="cat_ru:OrganizationName">
                            <xsl:value-of select="cat_ru:OrganizationName"/>
                          </xsl:if>
                          <xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
							  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="cat_ru:ShortName"/>
                          </xsl:if>
                        </td>
                      </tr>
						<xsl:if test="RUScat_ru:SubjectAddressDetails">
							<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
							<tr>
								<td class="graph" style="border-top:0px solid #ffffff; border-bottom:0px solid #ffffff; border-right:0px solid #ffffff; border-left:0px solid #ffffff;">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
							</xsl:for-each>
						</xsl:if>

                      <xsl:if test="racm:ConsigneeSign">
						<tr>
							<td class="graph" style="border-top:0px solid #ffffff; border-bottom:0px solid #ffffff; border-right:0px solid #ffffff; border-left:0px solid #ffffff;">
								<xsl:if test="racm:ConsigneeSign='0'">по товаросопроводительным документам</xsl:if>
								<xsl:if test="racm:ConsigneeSign='1'">по доверенности</xsl:if>
							</td>
						</tr>
                      </xsl:if>
                    </xsl:for-each>
                  </table>
                </td>
                <td width="15%">
                  <span class="graph">
                    <xsl:choose>  
                      <xsl:when test="racm:Decision='1'">Требуется уплата таможенных платежей</xsl:when>
                      <xsl:when test="racm:Decision='2'">Выпуск товаров без уплаты таможенных платежей</xsl:when>
                      <xsl:when test="racm:Decision='3'">Выпуск товаров (таможенные платежи уплачены)</xsl:when>
                      <xsl:when test="racm:Decision='4'">Отказ в выпуске товаров</xsl:when>
                      <xsl:when test="racm:Decision='5'">выпуск возвращаемых товаров</xsl:when>
                      <!--xsl:when test="racm:Decision='6'">Выпуск товаров (таможенные платежи уплачены)</xsl:when-->
                    </xsl:choose>
                    <br/><xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="racm:DecisionDate"/>
                    </xsl:call-template>
                    <!--xsl:if test="racm:TypeDuties='0'">исчисление платежей от нормы ввоза</xsl:if>
                    <xsl:if test="racm:TypeDuties='1'">совокупный платеж</xsl:if-->
                    <xsl:if test="racm:ReasonCode">
						<br/>
						<xsl:text>код причины отказа: </xsl:text>
						<xsl:value-of select="racm:ReasonCode"/>
                    </xsl:if>
                    <xsl:if test="racm:Reason">
						<br/>
						<xsl:text>причина отказа: </xsl:text>
						<xsl:value-of select="racm:Reason"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center" width="14%">
                  <span class="graph">
                    <xsl:for-each select="racm:ConsignmentGroup/racm:TaxBase">
						<xsl:if test="racm:TaxBaseKind='0'">
							<xsl:value-of select="racm:TaxBaseEuro"/> евро<br/>
						</xsl:if>
						<xsl:if test="racm:TaxBaseKind='1'">
							<xsl:value-of select="racm:TaxBaseWeight"/> кг
						</xsl:if>
                    </xsl:for-each>
                  </span>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
</xsl:stylesheet>
