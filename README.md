# yimv2

快速编译（生成 DLL）：

```bash
./scripts/build_yimmenuv2_dll.sh
```

成功后 DLL 位于：

- `YimMenuV2-enhanced/build/libYimMenuV2.dll`

如果你只想要“代码文本”形式（不传文件），可把 DLL 转成 Base64 文本：

```bash
base64 -w 0 YimMenuV2-enhanced/build/libYimMenuV2.dll
```

> 注意：Base64 文本会很长。
