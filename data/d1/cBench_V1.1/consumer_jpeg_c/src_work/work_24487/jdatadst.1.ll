; ModuleID = 'jdatadst.ll'
source_filename = "jdatadst.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my_destination_mgr = type { %struct.jpeg_destination_mgr, %struct._IO_FILE*, i8* }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %5 = icmp eq %struct.jpeg_destination_mgr* %4, null
  %6 = ptrtoint %struct.jpeg_destination_mgr* %4 to i64
  br i1 %5, label %7, label %14

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %9 = bitcast %struct.jpeg_memory_mgr** %8 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %9, align 8
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %10, align 8
  %.cast3 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %12 = tail call i8* %11(%struct.jpeg_common_struct* %.cast3, i32 0, i64 56) #3
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i8**
  store i8* %12, i8** %sunkaddr5, align 8
  %13 = ptrtoint i8* %12 to i64
  br label %14

; <label>:14:                                     ; preds = %7, %2
  %15 = phi i64 [ %13, %7 ], [ %6, %2 ]
  %16 = ptrtoint %struct._IO_FILE* %1 to i64
  %.cast = inttoptr i64 %15 to %struct.jpeg_destination_mgr*
  %17 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @init_destination, void (%struct.jpeg_compress_struct*)** %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 3
  store i32 (%struct.jpeg_compress_struct*)* @empty_output_buffer, i32 (%struct.jpeg_compress_struct*)** %18, align 8
  %19 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 4
  store void (%struct.jpeg_compress_struct*)* @term_destination, void (%struct.jpeg_compress_struct*)** %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 1
  %21 = bitcast %struct.jpeg_destination_mgr* %20 to i64*
  store i64 %16, i64* %21, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @init_destination(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.my_destination_mgr*, align 8
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_destination_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = bitcast %struct.my_destination_mgr** %2 to i64*
  store i64 %5, i64* %6, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %8, align 8
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %12 = tail call i8* %10(%struct.jpeg_common_struct* %11, i32 1, i64 4096) #3
  %13 = inttoptr i64 %5 to %struct.my_destination_mgr*
  %14 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %13, i64 0, i32 2
  store i8* %12, i8** %14, align 8
  %.cast = ptrtoint i8* %12 to i64
  %15 = inttoptr i64 %5 to i64*
  store i64 %.cast, i64* %15, align 8
  %16 = bitcast %struct.my_destination_mgr** %2 to %struct.jpeg_destination_mgr**
  %17 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %17, i64 0, i32 1
  store i64 4096, i64* %18, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @empty_output_buffer(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.my_destination_mgr*, align 8
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %4 = bitcast %struct.jpeg_destination_mgr** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = bitcast %struct.my_destination_mgr** %2 to i64*
  store i64 %5, i64* %6, align 8
  %.cast = inttoptr i64 %5 to %struct.my_destination_mgr*
  %7 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %.cast, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %.cast, i64 0, i32 1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %11 = tail call i64 @fwrite(i8* %8, i64 1, i64 4096, %struct._IO_FILE* %10) #3
  %12 = icmp eq i64 %11, 4096
  br i1 %12, label %21, label %13

; <label>:13:                                     ; preds = %1
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 36, i32* %17, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  tail call void %20(%struct.jpeg_common_struct* %15) #3
  br label %21

; <label>:21:                                     ; preds = %1, %13
  %sunkaddr = add i64 %5, 48
  %sunkaddr2 = inttoptr i64 %sunkaddr to i64*
  %22 = load i64, i64* %sunkaddr2, align 8
  %23 = inttoptr i64 %5 to i64*
  store i64 %22, i64* %23, align 8
  %24 = bitcast %struct.my_destination_mgr** %2 to %struct.jpeg_destination_mgr**
  %25 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %25, i64 0, i32 1
  store i64 4096, i64* %26, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @term_destination(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %3 = bitcast %struct.jpeg_destination_mgr** %2 to i64*
  %4 = load i64, i64* %3, align 8
  %.cast = inttoptr i64 %4 to %struct.jpeg_destination_mgr*
  %5 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = sub i64 4096, %6
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %1
  %9 = inttoptr i64 %4 to %struct.my_destination_mgr*
  %.pre = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %9, i64 0, i32 1
  br label %26

; <label>:10:                                     ; preds = %1
  %11 = inttoptr i64 %4 to %struct.my_destination_mgr*
  %12 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %11, i64 0, i32 2
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %11, i64 0, i32 1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  %16 = tail call i64 @fwrite(i8* %13, i64 1, i64 %7, %struct._IO_FILE* %15) #3
  %17 = icmp eq i64 %16, %7
  br i1 %17, label %26, label %18

; <label>:18:                                     ; preds = %10
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 5
  store i32 36, i32* %22, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %24 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %23, align 8
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  tail call void %25(%struct.jpeg_common_struct* %19) #3
  br label %26

; <label>:26:                                     ; preds = %._crit_edge, %10, %18
  %.pre-phi = phi %struct._IO_FILE** [ %.pre, %._crit_edge ], [ %14, %10 ], [ %14, %18 ]
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %.pre-phi, align 8
  %28 = tail call i32 @fflush(%struct._IO_FILE* %27) #3
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %.pre-phi, align 8
  %30 = tail call i32 @ferror(%struct._IO_FILE* %29) #3
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %40, label %32

; <label>:32:                                     ; preds = %26
  %33 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %34 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 5
  store i32 36, i32* %36, align 8
  %37 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %38 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %37, align 8
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  tail call void %39(%struct.jpeg_common_struct* %33) #3
  ret void

; <label>:40:                                     ; preds = %26
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) local_unnamed_addr #1

declare i32 @fflush(%struct._IO_FILE*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
