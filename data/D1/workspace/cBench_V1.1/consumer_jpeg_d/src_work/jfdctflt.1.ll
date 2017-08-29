; ModuleID = 'jfdctflt.ll'
source_filename = "jfdctflt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_fdct_float(float* nocapture) #0 {
  br label %2

; <label>:2:                                      ; preds = %1, %2
  %.06 = phi i32 [ 7, %1 ], [ %53, %2 ]
  %.015 = phi float* [ %0, %1 ], [ %52, %2 ]
  %3 = load float, float* %.015, align 4
  %4 = getelementptr inbounds float, float* %.015, i64 7
  %5 = load float, float* %4, align 4
  %6 = fadd float %3, %5
  %7 = fsub float %3, %5
  %8 = getelementptr inbounds float, float* %.015, i64 1
  %9 = load float, float* %8, align 4
  %10 = getelementptr inbounds float, float* %.015, i64 6
  %11 = load float, float* %10, align 4
  %12 = fadd float %9, %11
  %13 = fsub float %9, %11
  %14 = getelementptr inbounds float, float* %.015, i64 2
  %15 = load float, float* %14, align 4
  %16 = getelementptr inbounds float, float* %.015, i64 5
  %17 = load float, float* %16, align 4
  %18 = fadd float %15, %17
  %19 = fsub float %15, %17
  %20 = getelementptr inbounds float, float* %.015, i64 3
  %21 = load float, float* %20, align 4
  %22 = getelementptr inbounds float, float* %.015, i64 4
  %23 = load float, float* %22, align 4
  %24 = fadd float %21, %23
  %25 = fsub float %21, %23
  %26 = fadd float %6, %24
  %27 = fsub float %6, %24
  %28 = fadd float %12, %18
  %29 = fsub float %12, %18
  %30 = fadd float %28, %26
  store float %30, float* %.015, align 4
  %31 = fsub float %26, %28
  store float %31, float* %22, align 4
  %32 = fadd float %29, %27
  %33 = fmul float %32, 0x3FE6A09E60000000
  %34 = fadd float %27, %33
  store float %34, float* %14, align 4
  %35 = fsub float %27, %33
  store float %35, float* %10, align 4
  %36 = fadd float %19, %25
  %37 = fadd float %13, %19
  %38 = fadd float %7, %13
  %39 = fsub float %36, %38
  %40 = fmul float %39, 0x3FD87DE2A0000000
  %41 = fmul float %36, 0x3FE1517A80000000
  %42 = fadd float %41, %40
  %43 = fmul float %38, 0x3FF4E7AEA0000000
  %44 = fadd float %43, %40
  %45 = fmul float %37, 0x3FE6A09E60000000
  %46 = fadd float %7, %45
  %47 = fsub float %7, %45
  %48 = fadd float %47, %42
  store float %48, float* %16, align 4
  %49 = fsub float %47, %42
  store float %49, float* %20, align 4
  %50 = fadd float %46, %44
  store float %50, float* %8, align 4
  %51 = fsub float %46, %44
  store float %51, float* %4, align 4
  %52 = getelementptr inbounds float, float* %.015, i64 8
  %53 = add nsw i32 %.06, -1
  %54 = icmp sgt i32 %.06, 0
  br i1 %54, label %2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.14 = phi i32 [ %105, %.preheader ], [ 7, %.preheader.preheader ]
  %.123 = phi float* [ %104, %.preheader ], [ %0, %.preheader.preheader ]
  %55 = load float, float* %.123, align 4
  %56 = getelementptr inbounds float, float* %.123, i64 56
  %57 = load float, float* %56, align 4
  %58 = fadd float %55, %57
  %59 = fsub float %55, %57
  %60 = getelementptr inbounds float, float* %.123, i64 8
  %61 = load float, float* %60, align 4
  %62 = getelementptr inbounds float, float* %.123, i64 48
  %63 = load float, float* %62, align 4
  %64 = fadd float %61, %63
  %65 = fsub float %61, %63
  %66 = getelementptr inbounds float, float* %.123, i64 16
  %67 = load float, float* %66, align 4
  %68 = getelementptr inbounds float, float* %.123, i64 40
  %69 = load float, float* %68, align 4
  %70 = fadd float %67, %69
  %71 = fsub float %67, %69
  %72 = getelementptr inbounds float, float* %.123, i64 24
  %73 = load float, float* %72, align 4
  %74 = getelementptr inbounds float, float* %.123, i64 32
  %75 = load float, float* %74, align 4
  %76 = fadd float %73, %75
  %77 = fsub float %73, %75
  %78 = fadd float %58, %76
  %79 = fsub float %58, %76
  %80 = fadd float %64, %70
  %81 = fsub float %64, %70
  %82 = fadd float %80, %78
  store float %82, float* %.123, align 4
  %83 = fsub float %78, %80
  store float %83, float* %74, align 4
  %84 = fadd float %81, %79
  %85 = fmul float %84, 0x3FE6A09E60000000
  %86 = fadd float %79, %85
  store float %86, float* %66, align 4
  %87 = fsub float %79, %85
  store float %87, float* %62, align 4
  %88 = fadd float %71, %77
  %89 = fadd float %65, %71
  %90 = fadd float %59, %65
  %91 = fsub float %88, %90
  %92 = fmul float %91, 0x3FD87DE2A0000000
  %93 = fmul float %88, 0x3FE1517A80000000
  %94 = fadd float %93, %92
  %95 = fmul float %90, 0x3FF4E7AEA0000000
  %96 = fadd float %95, %92
  %97 = fmul float %89, 0x3FE6A09E60000000
  %98 = fadd float %59, %97
  %99 = fsub float %59, %97
  %100 = fadd float %99, %94
  store float %100, float* %68, align 4
  %101 = fsub float %99, %94
  store float %101, float* %72, align 4
  %102 = fadd float %98, %96
  store float %102, float* %60, align 4
  %103 = fsub float %98, %96
  store float %103, float* %56, align 4
  %104 = getelementptr inbounds float, float* %.123, i64 1
  %105 = add nsw i32 %.14, -1
  %106 = icmp sgt i32 %.14, 0
  br i1 %106, label %.preheader, label %107

; <label>:107:                                    ; preds = %.preheader
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
