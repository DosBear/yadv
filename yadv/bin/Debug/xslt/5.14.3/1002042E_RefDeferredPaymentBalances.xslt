<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rdpb="urn:customs.ru:Information:CommercialFinanceDocuments:RefDeferredPaymentBalances:5.14.3" xmlns:ns1="urn:customs.ru:Information:CommercialFinanceDocuments:RefDeferredPaymentBalances:5.14.3">
  <!-- Шаблон для типа RefDeferredPaymentBalancesType -->
  <xsl:template match="rdpb:RefDeferredPaymentBalances">
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
							<xsl:when test="rdpb:DecisionRegNumber/rdpb:AbbTermsPay='ОП'">Ответ на запрос об остатках в рамках использования Решения о предоставлении отсрочки уплаты ввозных таможенных пошлин, налогов</xsl:when>
							<xsl:when test="rdpb:DecisionRegNumber/rdpb:AbbTermsPay='РП'">Ответ на запрос об остатках в рамках использования Решения о предоставлении рассрочки уплаты ввозных таможенных пошлин, налогов</xsl:when>
							<xsl:otherwise>Ответ на запрос об остатках в рамках использования Решения о предоставлении отсрочки/рассрочки уплаты ввозных таможенных пошлин, налогов</xsl:otherwise>
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
          <xsl:if test="rdpb:DecisionRegNumber">
			  <table>
				<tr>
				  <td style="width:3%"/>
				  <td style="width:47%"/>
				  <td style="width:50%"/>
				</tr>
				<tr>
				  <td class="annot title marg-top" style="width:50%" colspan="2">Регистрационный номер Решения</td>
				  <td class="value graphMain">
					<xsl:apply-templates select="rdpb:DecisionRegNumber"/>
				  </td>
				</tr>
				<tr>
				  <td/>
				  <td class="annot graphMain">Расшифровка аббревиатуры основания&#160;(<xsl:value-of select="rdpb:DecisionRegNumber/rdpb:AbbBasis"/>)</td>
				  <td class="value graphMain">
					<xsl:choose>
					  <xsl:when test="rdpb:DecisionRegNumber/rdpb:AbbBasis='-'">
						<xsl:text>в случаях, касающихся отсрочки, предоставление которой предусмотрено пунктом 1 статьи 59 ТК ЕАЭС</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdpb:DecisionRegNumber/rdpb:AbbBasis='О'">
						<xsl:text>в иных случаях</xsl:text>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:value-of select="rdpb:DecisionRegNumber/rdpb:AbbBasis" />
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
				<tr>
				  <td/>
				  <td class="annot graphMain">Расшифровка префикса порядкового номера Решения по журналу регистрации, указывающего на вид принятого решения об отсрочке или рассрочке уплаты ввозных таможенных пошлин, налогов&#160;(<xsl:value-of select="rdpb:DecisionRegNumber/rdpb:SerialNumberPrefix"/>)</td>
				  <td class="value graphMain">
					<xsl:choose>
					  <xsl:when test="rdpb:DecisionRegNumber/rdpb:SerialNumberPrefix='Р'">
						<xsl:text>решение о предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdpb:DecisionRegNumber/rdpb:SerialNumberPrefix='О'">
						<xsl:text>решение об отказе в предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:when test="rdpb:DecisionRegNumber/rdpb:SerialNumberPrefix='А'">
						<xsl:text>решение об аннулировании решения в предоставлении</xsl:text>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:value-of select="rdpb:DecisionRegNumber/rdpb:SerialNumberPrefix" />
					  </xsl:otherwise>
					</xsl:choose>
				  </td>
				</tr>
			  </table>
			  <br/>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Общая сумма платежей, указанная в Решении, по которым может быть предоставлена отсрочка (рассрочка), рублей</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="translate(rdpb:TotalAmount, '.', ',')" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Признак уплаты процентов</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="rdpb:PercentAmount='true' or rdpb:PercentAmount='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="rdpb:PercentAmount='false' or rdpb:PercentAmount='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="rdpb:PercentAmount" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Общая сумма платежей, по которым уже предоставлена отсрочка (рассрочка), рублей</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="translate(rdpb:TotalFundsAmount, '.', ',')" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Общая сумма платежей, по которым может быть предоставлена отсрочка (рассрочка), рублей</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="translate(rdpb:TotalBalanceAmount, '.', ',')" />
              </td>
            </tr>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
	<xsl:template match="rdpb:DecisionRegNumber">
		<xsl:value-of select="rdpb:CustomsCode" />
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
		  <xsl:with-param name="dateIn" select="rdpb:RegistrationDate" />
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdpb:AbbTermsPay" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdpb:AbbBasis" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdpb:SerialNumberPrefix" />
		<xsl:value-of select="rdpb:SerialNumber" />
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
</xsl:stylesheet>