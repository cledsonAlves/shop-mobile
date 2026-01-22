#!/usr/bin/env python3
import os
from PIL import Image, ImageDraw

def create_app_icon():
    # Criar ícone 1024x1024
    size = 1024
    image = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    
    # Criar gradiente laranja
    for y in range(size):
        r = int(240 + (255 - 240) * y / size)
        g = int(110 + (138 - 110) * y / size)
        b = int(66 + (101 - 66) * y / size)
        draw.rectangle([(0, y), (size, y + 1)], fill=(r, g, b, 255))
    
    # Criar máscara arredondada
    mask = Image.new('L', (size, size), 0)
    mask_draw = ImageDraw.Draw(mask)
    mask_draw.rounded_rectangle([(0, 0), (size, size)], radius=230, fill=255)
    
    # Aplicar máscara
    image.putalpha(mask)
    
    # Desenhar ícone de sacola branca
    bag_size = size // 2
    center_x, center_y = size // 2, size // 2
    
    # Corpo da sacola
    bag_width = bag_size * 0.7
    bag_height = bag_size * 0.65
    bag_left = center_x - bag_width // 2
    bag_top = center_y - bag_height // 4
    
    draw.rounded_rectangle(
        [(bag_left, bag_top), (bag_left + bag_width, bag_top + bag_height)],
        radius=20,
        outline=(255, 255, 255, 255),
        width=25
    )
    
    # Alças da sacola
    handle_width = bag_width * 0.4
    handle_height = bag_height * 0.25
    handle_left = center_x - handle_width // 2
    handle_top = bag_top - 10
    
    draw.arc(
        [(handle_left, handle_top - handle_height), 
         (handle_left + handle_width, handle_top + handle_height)],
        start=0, end=180,
        fill=(255, 255, 255, 255),
        width=25
    )
    
    # Salvar ícone principal
    image.save('assets/icon/app_icon.png', 'PNG')
    print("✓ Ícone principal criado: assets/icon/app_icon.png")
    
    # Criar ícone foreground 432x432
    fg_size = 432
    fg_image = Image.new('RGBA', (fg_size, fg_size), (0, 0, 0, 0))
    fg_draw = ImageDraw.Draw(fg_image)
    
    # Desenhar ícone de sacola branca (foreground)
    fg_bag_size = fg_size * 0.8
    fg_center_x, fg_center_y = fg_size // 2, fg_size // 2
    
    fg_bag_width = fg_bag_size * 0.7
    fg_bag_height = fg_bag_size * 0.65
    fg_bag_left = fg_center_x - fg_bag_width // 2
    fg_bag_top = fg_center_y - fg_bag_height // 4
    
    fg_draw.rounded_rectangle(
        [(fg_bag_left, fg_bag_top), (fg_bag_left + fg_bag_width, fg_bag_top + fg_bag_height)],
        radius=15,
        outline=(255, 255, 255, 255),
        width=20
    )
    
    fg_handle_width = fg_bag_width * 0.4
    fg_handle_height = fg_bag_height * 0.25
    fg_handle_left = fg_center_x - fg_handle_width // 2
    fg_handle_top = fg_bag_top - 8
    
    fg_draw.arc(
        [(fg_handle_left, fg_handle_top - fg_handle_height), 
         (fg_handle_left + fg_handle_width, fg_handle_top + fg_handle_height)],
        start=0, end=180,
        fill=(255, 255, 255, 255),
        width=20
    )
    
    fg_image.save('assets/icon/app_icon_foreground.png', 'PNG')
    print("✓ Ícone foreground criado: assets/icon/app_icon_foreground.png")

if __name__ == '__main__':
    os.makedirs('assets/icon', exist_ok=True)
    create_app_icon()
    print("\n✅ Ícones gerados com sucesso!")
    print("Execute agora: flutter pub get && flutter pub run flutter_launcher_icons")
