; ModuleID = 'crc_32.ll'
source_filename = "crc_32.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@crc_32_tab = internal unnamed_addr constant [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"%08lX %7ld %s\0A\00", align 1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @updateCRC32(i8 zeroext, i64) local_unnamed_addr #0 {
  %3 = zext i8 %0 to i64
  %.masked = and i64 %1, 255
  %4 = xor i64 %.masked, %3
  %5 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %4
  %6 = load i64, i64* %5, align 8
  %7 = lshr i64 %1, 8
  %8 = xor i64 %6, %7
  ret i64 %8
}

; Function Attrs: noinline nounwind uwtable
define i32 @crc32file(i8* nocapture readonly, i64* nocapture, i64* nocapture) local_unnamed_addr #1 {
  store i64 0, i64* %2, align 8
  %4 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %5 = icmp eq %struct._IO_FILE* %4, null
  br i1 %5, label %8, label %.preheader

.preheader:                                       ; preds = %3
  %6 = tail call i32 @_IO_getc(%struct._IO_FILE* nonnull %4)
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:8:                                      ; preds = %3
  tail call void @perror(i8* %0) #5
  br label %26

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %9 = phi i32 [ %19, %.lr.ph ], [ %6, %.lr.ph.preheader ]
  %.012 = phi i64 [ %18, %.lr.ph ], [ 4294967295, %.lr.ph.preheader ]
  %10 = load i64, i64* %2, align 8
  %11 = add nsw i64 %10, 1
  store i64 %11, i64* %2, align 8
  %12 = zext i32 %9 to i64
  %13 = xor i64 %12, %.012
  %14 = and i64 %13, 255
  %15 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %14
  %16 = load i64, i64* %15, align 8
  %17 = lshr i64 %.012, 8
  %18 = xor i64 %16, %17
  %19 = tail call i32 @_IO_getc(%struct._IO_FILE* nonnull %4)
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %phitmp = xor i64 %18, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.01.lcssa = phi i64 [ -4294967296, %.preheader ], [ %phitmp, %._crit_edge.loopexit ]
  %21 = tail call i32 @ferror(%struct._IO_FILE* nonnull %4) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %24, label %23

; <label>:23:                                     ; preds = %._crit_edge
  tail call void @perror(i8* %0) #5
  store i64 -1, i64* %2, align 8
  br label %24

; <label>:24:                                     ; preds = %._crit_edge, %23
  %25 = tail call i32 @fclose(%struct._IO_FILE* nonnull %4)
  store i64 %.01.lcssa, i64* %1, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %8
  %.0 = phi i32 [ -1, %8 ], [ 0, %24 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i64 @crc32buf(i8* nocapture readonly, i64) local_unnamed_addr #4 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %4 = load i8, i8* %0, align 1
  %5 = xor i8 %4, -1
  %6 = zext i8 %5 to i64
  %7 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %6
  %8 = load i64, i64* %7, align 8
  %9 = xor i64 %8, 16777215
  %10 = add i64 %1, -1
  %11 = getelementptr inbounds i8, i8* %0, i64 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr = phi i64 [ undef, %.lr.ph.preheader ], [ %9, %.lr.ph.prol ]
  %.05.unr = phi i8* [ %0, %.lr.ph.preheader ], [ %11, %.lr.ph.prol ]
  %.014.unr = phi i64 [ %1, %.lr.ph.preheader ], [ %10, %.lr.ph.prol ]
  %.023.unr = phi i64 [ 4294967295, %.lr.ph.preheader ], [ %9, %.lr.ph.prol ]
  %12 = icmp eq i64 %1, 1
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.05 = phi i8* [ %29, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader8 ]
  %.014 = phi i64 [ %28, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader8 ]
  %.023 = phi i64 [ %27, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader8 ]
  %.02.masked = and i64 %.023, 255
  %13 = load i8, i8* %.05, align 1
  %14 = zext i8 %13 to i64
  %15 = xor i64 %14, %.02.masked
  %16 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %15
  %17 = load i64, i64* %16, align 8
  %18 = lshr i64 %.023, 8
  %19 = xor i64 %17, %18
  %20 = getelementptr inbounds i8, i8* %.05, i64 1
  %.02.masked.1 = and i64 %19, 255
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i64
  %23 = xor i64 %22, %.02.masked.1
  %24 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %23
  %25 = load i64, i64* %24, align 8
  %26 = lshr i64 %19, 8
  %27 = xor i64 %25, %26
  %28 = add i64 %.014, -2
  %29 = getelementptr inbounds i8, i8* %.05, i64 2
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  %.02.lcssa = phi i64 [ 4294967295, %2 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %27, %._crit_edge.loopexit ]
  %31 = xor i64 %.02.lcssa, -1
  ret i64 %31
}

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly, i32) local_unnamed_addr #1 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = add nsw i32 %0, -1
  %7 = icmp sgt i32 %0, 1
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %8 = icmp eq i32 %2, 0
  br i1 %8, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %9 = phi i32 [ %14, %.lr.ph.split.us ], [ %6, %.lr.ph.split.us.preheader ]
  %.014.us = phi i8** [ %10, %.lr.ph.split.us ], [ %1, %.lr.ph.split.us.preheader ]
  %.023.us = phi i32 [ %13, %.lr.ph.split.us ], [ 0, %.lr.ph.split.us.preheader ]
  %10 = getelementptr inbounds i8*, i8** %.014.us, i64 1
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 @crc32file(i8* %11, i64* nonnull %4, i64* nonnull %5)
  %13 = or i32 %12, %.023.us
  %14 = add nsw i32 %9, -1
  %15 = icmp sgt i32 %9, 1
  br i1 %15, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %.lr.ph.split
  %16 = phi i32 [ %25, %.lr.ph.split ], [ %6, %.lr.ph.split.preheader ]
  %.014 = phi i8** [ %17, %.lr.ph.split ], [ %1, %.lr.ph.split.preheader ]
  %.023 = phi i32 [ %20, %.lr.ph.split ], [ 0, %.lr.ph.split.preheader ]
  %17 = getelementptr inbounds i8*, i8** %.014, i64 1
  %18 = load i8*, i8** %17, align 8
  %19 = call i32 @crc32file(i8* %18, i64* nonnull %4, i64* nonnull %5)
  %20 = or i32 %19, %.023
  %21 = load i64, i64* %4, align 8
  %22 = load i64, i64* %5, align 8
  %23 = load i8*, i8** %17, align 8
  %24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 %21, i64 %22, i8* %23)
  %25 = add nsw i32 %16, -1
  %26 = icmp sgt i32 %16, 1
  br i1 %26, label %.lr.ph.split, label %._crit_edge.loopexit11

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us
  br label %._crit_edge

._crit_edge.loopexit11:                           ; preds = %.lr.ph.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit11, %._crit_edge.loopexit, %3
  %.02.lcssa = phi i32 [ 0, %3 ], [ %13, %._crit_edge.loopexit ], [ %20, %._crit_edge.loopexit11 ]
  %27 = icmp ne i32 %.02.lcssa, 0
  %28 = zext i1 %27 to i32
  ret i32 %28
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
