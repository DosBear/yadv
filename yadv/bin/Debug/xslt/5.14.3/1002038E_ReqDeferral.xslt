<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rdef="urn:customs.ru:Information:CommercialFinanceDocuments:ReqDeferral:5.14.3">
  <!-- Шаблон для типа ReqDeferralType -->
  <xsl:template match="rdef:ReqDeferral">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                  <b>
					<xsl:choose>
						<xsl:when test="rdef:DocType='0'">
							<xsl:choose>
								<xsl:when test="rdef:DecisionRegNumber/rdef:AbbTermsPay='ОП'">Запрос статуса Решения о предоставлении отсрочки уплаты ввозных таможенных пошлин, налогов</xsl:when>
								<xsl:when test="rdef:DecisionRegNumber/rdef:AbbTermsPay='РП'">Запрос статуса Решения о предоставлении рассрочки уплаты ввозных таможенных пошлин, налогов</xsl:when>
								<xsl:otherwise>Запрос статуса Решения о предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин, налогов</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="rdef:DocType='0'">Запрос на резервирование сумм по Решению</xsl:when>
						<xsl:otherwise>Запрос статуса Решения о предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин, налогов / Запрос на резервирование сумм по Решению</xsl:otherwise>
					</xsl:choose>
                  </b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата и время запроса</td>
              <td class="value graphMain" style="width:50%">
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rdef:ReqTime"/></xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(rdef:ReqTime, 12, 8)"/>
              </td>
            </tr>
          </table>
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Тип запроса</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="rdef:DocType='0'">
                    <xsl:text>запрос статуса</xsl:text>
                  </xsl:when>
                  <xsl:when test="rdef:DocType='1'">
                    <xsl:text>запрос на резевирование сумм по решению</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="rdef:DocType" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table-->
          <xsl:if test="rdef:DecisionRegNumber">
            <div>
              <br/>
			  <table>
				<tr>
				  <td style="width:3%"/>
				  <td style="width:47%"/>
				  <td style="width:50%"/>
				</tr>
				<tr>
				  <td class="annot title marg-top" colspan="2">Регистрационный номер Решения</td>
				  <td class="value graphMain">
					<xsl:apply-templates select="rdef:DecisionRegNumber"/>
				  </td>
				</tr>
				<tr>
				  <td/>
				  <td class="annot graphMain">Расшифровка аббревиатуры основания&#160;(<xsl:value-of select="rdef:DecisionRegNumber/rdef:AbbBasis"/>)</td>
				  <td class="value graphMain">
					<xsl:choose>
					  <xsl:when test="rdef:DecisionRegNumber/rdef:AbbBasis='-'">
						<xsl:text>в случаях, касающихся отсрочки, предоставление которой предусмотрено пунктом 1 статьи 59 ТК ЕАЭС</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdef:DecisionRegNumber/rdef:AbbBasis='О'">
						<xsl:text>в иных случаях</xsl:text>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:value-of select="rdef:DecisionRegNumber/rdef:AbbBasis" />
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
				<tr>
				  <td/>
				  <td class="annot graphMain">Расшифровка префикса порядкового номера Решения по журналу регистрации, указывающего на вид принятого решения об отсрочке или рассрочке уплаты ввозных таможенных пошлин, налогов&#160;(<xsl:value-of select="rdef:DecisionRegNumber/rdef:SerialNumberPrefix"/>)</td>
				  <td class="value graphMain">
					<xsl:choose>
					  <xsl:when test="rdef:DecisionRegNumber/rdef:SerialNumberPrefix='Р'">
						<xsl:text>решение о предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdef:DecisionRegNumber/rdef:SerialNumberPrefix='О'">
						<xsl:text>решение об отказе в предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdef:DecisionRegNumber/rdef:SerialNumberPrefix='А'">
						<xsl:text>решение об аннулировании решения в предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:value-of select="rdef:DecisionRegNumber/rdef:SerialNumberPrefix" />
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
			  </table>
			</div>
          </xsl:if>
          <xsl:if test="rdef:DTNumber">
            <br/>
            <div>
			  <table>
				<tr>
				  <td class="annot title marg-top" style="width:50%">Регистрационный номер ДТ</td>
				  <td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="rdef:DTNumber"/>
				  </td>
				</tr>
			  </table>
			</div>
          </xsl:if>
          <xsl:if test="rdef:Declarant">
            <div class="title marg-top">Сведения о декларанте</div>
            <div>
              <xsl:apply-templates select="rdef:Declarant">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="rdef:ImportCustomsDuty">
            <div class="title marg-top">Виды и суммы платежей ввозной таможенной пошлины, заявленных к отсрочке, рассрочке </div>
            <div>
              <xsl:apply-templates select="rdef:ImportCustomsDuty">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="rdef:Excise">
            <div class="title marg-top">Виды и суммы платежей акциза, заявленных к отсрочке, рассрочке</div>
            <div>
              <xsl:apply-templates select="rdef:Excise">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="rdef:ValueAddedTax">
            <div class="title marg-top">Виды и суммы платежей налога на добавленную стоимость, заявленных к отсрочке, рассрочке</div>
            <div>
              <xsl:apply-templates select="rdef:ValueAddedTax">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="rdef:TotalAmount">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Общая сумма платежей, , заявленных к отсрочке, рассрочке</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="translate(rdef:TotalAmount, '.', ',')" />
                </td>
              </tr>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rdef:PaymentRecType -->
  <xsl:template match="rdef:CustomsPaymentModeCode">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="rdef:CustomsPaymentModeCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(rdef:ReqAmount, '.', ',')" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="rdef:DTNumber">
        <xsl:value-of select="cat_ru:CustomsCode" />
        <xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
		  <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate" />
		</xsl:call-template>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="cat_ru:GTDNumber" />
  </xsl:template>
  <!-- Шаблон для типа rdef:DecisionRegNumberType -->
  <xsl:template match="rdef:DecisionRegNumber">
		<xsl:value-of select="rdef:CustomsCode" />
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
		  <xsl:with-param name="dateIn" select="rdef:RegistrationDate" />
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdef:AbbTermsPay" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdef:AbbBasis" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdef:SerialNumberPrefix" />
		<xsl:value-of select="rdef:SerialNumber" />
	</xsl:template>
  <!-- Шаблон для типа cat_ru:OrganizationBaseType -->
  <xsl:template match="rdef:Declarant">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rdef:PaymentType -->
  <xsl:template match="rdef:Excise">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="rdef:Amount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полная сумма, рублей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="translate(rdef:Amount, '.', ',')" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <div class="title marg-top">Детализация платежей по кодам платежа</div>
      <table class="bordered">
        <tbody>
          <tr class="title">
            <td class="graphMain bordered">Код вида платежа</td>
            <td class="graphMain bordered">Сумма, рублей</td>
          </tr>
          <xsl:for-each select="rdef:CustomsPaymentModeCode">
            <xsl:apply-templates select=".">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rdef:PaymentType -->
  <xsl:template match="rdef:ImportCustomsDuty">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="rdef:Amount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полная сумма, рублей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="translate(rdef:Amount, '.', ',')" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <div class="title marg-top">Детализация платежей по кодам платежа</div>
      <table class="bordered">
        <tbody>
          <tr class="title">
            <td class="graphMain bordered">Код вида платежа</td>
            <td class="graphMain bordered">Сумма, рублей</td>
          </tr>
          <xsl:for-each select="rdef:CustomsPaymentModeCode">
            <xsl:apply-templates select=".">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа rdef:PaymentType -->
  <xsl:template match="rdef:ValueAddedTax">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="rdef:Amount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полная сумма, рублей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="translate(rdef:Amount, '.', ',')" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <div class="title marg-top">Детализация платежей по кодам платежа</div>
      <table class="bordered">
        <tbody>
          <tr class="title">
            <td class="graphMain bordered">Код вида платежа</td>
            <td class="graphMain bordered">Сумма, рублей</td>
          </tr>
          <xsl:for-each select="rdef:CustomsPaymentModeCode">
            <xsl:apply-templates select=".">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	<xsl:template name="gtd_date">
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