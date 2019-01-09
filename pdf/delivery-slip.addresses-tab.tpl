<table id="addresses-tab" cellspacing="0" cellpadding="0">
	<tr>
		<td width="33%">
			<span class="bold">Nidara Online S.L.</span><br/><br/>
			{l s='B-12938577' d='Shop.Sbpdf' pdf='true'}<br/>
			C/ Francia nave 10F<br/>
			P.I. Acceso Sur<br/>
			12006 Castellón<br/>
			{l s='España' d='Shop.Sbpdf' pdf='true'}
		</td>
		<td width="33%">{if $delivery_address}<span class="bold">{l s='Delivery Address' d='Shop.Pdf' pdf='true'}</span><br/><br/>
				{$delivery_address}
			{/if}
		</td>
		<td width="33%"><span class="bold">{l s='Billing Address' d='Shop.Pdf' pdf='true'}</span><br/><br/>
				{$invoice_address}
		</td>
	</tr>
</table>
