; ModuleID = 'jcomapi.ll'
source_filename = "jcomapi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { {}*, void (%struct.jpeg_common_struct*, i32)*, {}*, void (%struct.jpeg_common_struct*, i8*)*, {}*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort(%struct.jpeg_common_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 9
  %5 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %4, align 8
  tail call void %5(%struct.jpeg_common_struct* %0, i32 1) #1
  %6 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 3
  %7 = load i32, i32* %6, align 8
  %8 = icmp ne i32 %7, 0
  %9 = select i1 %8, i32 200, i32 100
  %10 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 4
  store i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy(%struct.jpeg_common_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = icmp eq %struct.jpeg_memory_mgr* %3, null
  br i1 %4, label %9, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 10
  %7 = bitcast {}** %6 to void (%struct.jpeg_common_struct*)**
  %8 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %7, align 8
  tail call void %8(%struct.jpeg_common_struct* nonnull %0) #1
  br label %9

; <label>:9:                                      ; preds = %1, %5
  %sunkaddr = ptrtoint %struct.jpeg_common_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 8
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to %struct.jpeg_memory_mgr**
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %sunkaddr2, align 8
  %10 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 4
  store i32 0, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %0, i32 0, i64 132) #1
  %7 = bitcast i8* %6 to %struct.JQUANT_TBL*
  %8 = getelementptr inbounds i8, i8* %6, i64 128
  %9 = bitcast i8* %8 to i32*
  store i32 0, i32* %9, align 4
  ret %struct.JQUANT_TBL* %7
}

; Function Attrs: noinline nounwind uwtable
define %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %0, i32 0, i64 280) #1
  %7 = bitcast i8* %6 to %struct.JHUFF_TBL*
  %8 = getelementptr inbounds i8, i8* %6, i64 276
  %9 = bitcast i8* %8 to i32*
  store i32 0, i32* %9, align 4
  ret %struct.JHUFF_TBL* %7
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
