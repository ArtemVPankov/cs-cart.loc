{script src="js/addons/rus_dellin/checkout.js"}
{if $cart.chosen_shipping.$group_key == $shipping.shipping_id && $shipping.module == 'dellin' && $shipping.service_params.arrival_door == 'N'}

    {assign var="arrival_count" value=$shipping.data.arrival_terminals|count}
    {assign var="shipping_id" value=$shipping.shipping_id}
    {assign var="old_terminal" value=$arrival_terminal.$group_key.$shipping_id}
    <label for="select_terminals_{$group_key}"
           class="cm-required cm-multiple-radios hidden"
           data-ca-validator-error-message="{__("pickup_point_not_selected")}"></label>
    <div class="ty-checkout-select-terminals pickup__offices--list-{$group_key}" id="select_terminals_{$group_key}"
         data-ca-error-message-target-node-after-mode="true"
         data-ca-error-message-target-node-on-screen=".cm-open-pickups-msg"
         data-ca-error-message-target-node=".pickup__offices--list-{$group_key}">
        {foreach from=$shipping.data.arrival_terminals item=arrival_terminal}
            {assign var="arrival_name" value=$arrival_terminal.name}
            <div class="ty-one-terminal">
                <input type="radio" name="arrival_terminal[{$group_key}][{$shipping.shipping_id}]" value="{$arrival_terminal.code}" {if $old_terminal == $arrival_terminal.code || $arrival_count == 1}checked="checked"{/if} id="office_{$arrival_terminal.code}" class="ty-terminal-radio" />
                <div class="ty-terminal__label">
                    <label for="terminal_{$arrival_terminal.code}" >
                        <p class="ty-one-terminal__name">{$arrival_terminal.name}</p>
                        <div class="ty-one-terminal__description">
                            {$arrival_terminal.address}
                        </div>
                    </label>
                </div>
            </div>
        {/foreach}
    </div>
{/if}
