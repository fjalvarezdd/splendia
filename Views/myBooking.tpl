{include file=header.tpl title=$title}
<div class="content">
	<div class="leftNav">
		{include file=leftNav.tpl}
	</div>
	<div class="center">
		<h2>Hello, {$userId}</h2>
		<p>Here you can find your bookings!</p>
		{foreach from=$bookedRooms item=$room}
		<div class="room">
			<h3>{$room.title}</h3>
			<img src={$room.image}/>
			<div class="roomDescription">
				{$room.description}
			</div>
			<div class="roomFacilities">
				{$room.facilities}
			</div>
		</div>
		{/foreach}
	</div>
	<div class="rightNav">
		{include file=rightNav.tpl}
	</div>

</div>
{include file=footer.tpl} 