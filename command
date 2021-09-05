@client.command()

async def skin(ctx, *, content = None):
    if content is None:
        await ctx.send(f'No skin was given, try: {prefix}skin (skin name)')
    elif content.upper().startswith('CID_'):
        await client.party.me.set_outfit(asset=content.upper())
        await ctx.send(f'Skin set to: {content}')
    else:
        try:
            cosmetic = await BenBotAsync.get_cosmetic(
                lang="en",
                searchLang="en",
                name=content,
                backendType="AthenaCharacter"
            )
            await client.party.me.set_outfit(asset=cosmetic.id)
            await ctx.send(f'Skin set to: {cosmetic.name}')
        except BenBotAsync.exceptions.NotFound:
            await ctx.send(f'Could not find a skin named: {content}')
