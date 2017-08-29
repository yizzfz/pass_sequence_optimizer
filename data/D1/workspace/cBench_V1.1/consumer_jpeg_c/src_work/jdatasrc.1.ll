; ModuleID = 'jdatasrc.ll'
source_filename = "jdatasrc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my_source_mgr = type { %struct.jpeg_source_mgr, %struct._IO_FILE*, i8*, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_stdio_src(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %5 = icmp eq %struct.jpeg_source_mgr* %4, null
  br i1 %5, label %6, label %19

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %8, align 8
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %12 = tail call i8* %10(%struct.jpeg_common_struct* %11, i32 0, i64 80) #6
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i8**
  store i8* %12, i8** %sunkaddr2, align 8
  %13 = bitcast %struct.jpeg_memory_mgr** %7 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %13, align 8
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = tail call i8* %15(%struct.jpeg_common_struct* %11, i32 0, i64 4096) #6
  %17 = getelementptr inbounds i8, i8* %12, i64 64
  %18 = bitcast i8* %17 to i8**
  store i8* %16, i8** %18, align 8
  br label %19

; <label>:19:                                     ; preds = %2, %6
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to %struct.my_source_mgr**
  %20 = load %struct.my_source_mgr*, %struct.my_source_mgr** %sunkaddr5, align 8
  %21 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*)* @init_source, void (%struct.jpeg_decompress_struct*)** %21, align 8
  %22 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* @fill_input_buffer, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %23 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 0, i32 4
  store void (%struct.jpeg_decompress_struct*, i64)* @skip_input_data, void (%struct.jpeg_decompress_struct*, i64)** %23, align 8
  %24 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 0, i32 5
  store i32 (%struct.jpeg_decompress_struct*, i32)* @jpeg_resync_to_restart, i32 (%struct.jpeg_decompress_struct*, i32)** %24, align 8
  %25 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 0, i32 6
  store void (%struct.jpeg_decompress_struct*)* @term_source, void (%struct.jpeg_decompress_struct*)** %25, align 8
  %26 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %20, i64 0, i32 1
  store %struct._IO_FILE* %1, %struct._IO_FILE** %26, align 8
  %27 = bitcast %struct.my_source_mgr* %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 16, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_source(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_source_mgr** %2 to %struct.my_source_mgr**
  %4 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 3
  store i32 1, i32* %5, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @fill_input_buffer(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_source_mgr** %2 to %struct.my_source_mgr**
  %4 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 2
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 1
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %9 = tail call i64 @fread(i8* %6, i64 1, i64 4096, %struct._IO_FILE* %8)
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %34

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %23, label %15

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 5
  store i32 41, i32* %18, align 8
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %20 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %21 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %20, align 8
  %22 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %21(%struct.jpeg_common_struct* %22) #6
  br label %23

; <label>:23:                                     ; preds = %11, %15
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 116, i32* %26, align 8
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 1
  %29 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %28, align 8
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %29(%struct.jpeg_common_struct* %30, i32 -1) #6
  %sunkaddr = ptrtoint %struct.my_source_mgr* %4 to i64
  %sunkaddr1 = add i64 %sunkaddr, 64
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i8**
  %31 = load i8*, i8** %sunkaddr2, align 8
  store i8 -1, i8* %31, align 1
  %32 = load i8*, i8** %sunkaddr2, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  store i8 -39, i8* %33, align 1
  br label %34

; <label>:34:                                     ; preds = %1, %23
  %.0 = phi i64 [ 2, %23 ], [ %9, %1 ]
  %sunkaddr3 = ptrtoint %struct.my_source_mgr* %4 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 64
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64*
  %35 = load i64, i64* %sunkaddr5, align 8
  %36 = bitcast %struct.my_source_mgr* %4 to i64*
  store i64 %35, i64* %36, align 8
  %37 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 0, i32 1
  store i64 %.0, i64* %37, align 8
  %38 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %4, i64 0, i32 3
  store i32 0, i32* %38, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @skip_input_data(%struct.jpeg_decompress_struct*, i64) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_source_mgr** %3 to %struct.my_source_mgr**
  %5 = load %struct.my_source_mgr*, %struct.my_source_mgr** %4, align 8
  %6 = icmp sgt i64 %1, 0
  br i1 %6, label %.preheader, label %20

.preheader:                                       ; preds = %2
  %7 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %5, i64 0, i32 0, i32 1
  %8 = load i64, i64* %7, align 8
  %9 = icmp slt i64 %8, %1
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr9 = ptrtoint %struct.my_source_mgr* %5 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i64*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %10 = phi i64 [ %13, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.01 = phi i64 [ %11, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %11 = sub nsw i64 %.01, %10
  %12 = tail call i32 @fill_input_buffer(%struct.jpeg_decompress_struct* %0)
  %13 = load i64, i64* %sunkaddr11, align 8
  %14 = icmp sgt i64 %11, %13
  br i1 %14, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0.lcssa = phi i64 [ %1, %.preheader ], [ %11, %._crit_edge.loopexit ]
  %15 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %5, i64 0, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 %.0.lcssa
  store i8* %17, i8** %15, align 8
  %sunkaddr5 = ptrtoint %struct.my_source_mgr* %5 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 8
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i64*
  %18 = load i64, i64* %sunkaddr7, align 8
  %19 = sub i64 %18, %.0.lcssa
  store i64 %19, i64* %sunkaddr7, align 8
  br label %20

; <label>:20:                                     ; preds = %2, %._crit_edge
  ret void
}

declare i32 @jpeg_resync_to_restart(%struct.jpeg_decompress_struct*, i32) #2

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @term_source(%struct.jpeg_decompress_struct* nocapture) #3 {
  ret void
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
