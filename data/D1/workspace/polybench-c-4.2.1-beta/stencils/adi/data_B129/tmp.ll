; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %15, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %15 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %5 = alloca [1000 x double]*, align 8
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  store [1000 x double]* %0, [1000 x double]** %5, align 8
  store [1000 x double]* %1, [1000 x double]** %6, align 8
  store [1000 x double]* %2, [1000 x double]** %7, align 8
  store [1000 x double]* %3, [1000 x double]** %8, align 8
  store double 0xC09F400000000001, double* %9, align 8
  store double 0x40AF420000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %11, align 8
  store double 0xC08F400000000001, double* %12, align 8
  store double 0x409F440000000001, double* %13, align 8
  store double 0xC08F400000000001, double* %14, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %172, %4
  %15 = phi [1000 x double]* [ %1, %4 ], [ %.pre27, %172 ]
  %16 = phi i32 [ 1, %4 ], [ %174, %172 ]
  %17 = phi [1000 x double]* [ %2, %4 ], [ %68, %172 ]
  br label %18

; <label>:18:                                     ; preds = %._crit_edge20, %.preheader7
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge20 ], [ 1, %.preheader7 ]
  %19 = phi [1000 x double]* [ %.pre, %._crit_edge20 ], [ %15, %.preheader7 ]
  %20 = phi [1000 x double]* [ %68, %._crit_edge20 ], [ %17, %.preheader7 ]
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv8
  store double 1.000000e+00, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %20, i64 %indvars.iv8, i64 0
  store double 0.000000e+00, double* %22, align 8
  %23 = load [1000 x double]*, [1000 x double]** %6, align 8
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 0, i64 %indvars.iv8
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = load [1000 x double]*, [1000 x double]** %8, align 8
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %27, i64 %indvars.iv8
  %29 = bitcast [1000 x double]* %28 to i64*
  store i64 %26, i64* %29, align 8
  %30 = add nsw i64 %indvars.iv8, -1
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %.pre24 = load double, double* %9, align 8
  %.pre25 = load double, double* %10, align 8
  br label %31

; <label>:31:                                     ; preds = %31, %18
  %indvars.iv = phi i64 [ %indvars.iv.next, %31 ], [ 1, %18 ]
  %32 = phi double [ %72, %31 ], [ %.pre25, %18 ]
  %33 = phi double [ %62, %31 ], [ %.pre24, %18 ]
  %34 = phi [1000 x double]* [ %68, %31 ], [ %20, %18 ]
  %35 = load double, double* %11, align 8
  %36 = fsub double -0.000000e+00, %35
  %37 = add nsw i64 %indvars.iv, -1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv8, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fmul double %33, %39
  %41 = fadd double %40, %32
  %42 = fdiv double %36, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv8, i64 %indvars.iv
  store double %42, double* %43, align 8
  %44 = load double, double* %12, align 8
  %45 = load [1000 x double]*, [1000 x double]** %5, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv, i64 %30
  %47 = bitcast double* %46 to <2 x double>*
  %48 = fmul double %44, 2.000000e+00
  %49 = fadd double %48, 1.000000e+00
  %50 = load <2 x double>, <2 x double>* %47, align 8
  %51 = insertelement <2 x double> undef, double %44, i32 0
  %52 = insertelement <2 x double> %51, double %49, i32 1
  %53 = fmul <2 x double> %52, %50
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %55, %54
  %57 = load double, double* %14, align 8
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv, i64 %indvars.iv.next9
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %56, %60
  %62 = load double, double* %9, align 8
  %63 = load [1000 x double]*, [1000 x double]** %8, align 8
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv8, i64 %37
  %65 = load double, double* %64, align 8
  %66 = fmul double %62, %65
  %67 = fsub double %61, %66
  %68 = load [1000 x double]*, [1000 x double]** %7, align 8
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv8, i64 %37
  %70 = load double, double* %69, align 8
  %71 = fmul double %62, %70
  %72 = load double, double* %10, align 8
  %73 = fadd double %71, %72
  %74 = fdiv double %67, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv8, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %76, label %31

; <label>:76:                                     ; preds = %31
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 999, i64 %indvars.iv8
  store double 1.000000e+00, double* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %78, %76
  %indvars.iv6 = phi i64 [ 998, %76 ], [ %indvars.iv.next7.1, %78 ]
  %79 = phi double [ 1.000000e+00, %76 ], [ %92, %78 ]
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv8, i64 %indvars.iv6
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %79
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv8, i64 %indvars.iv6
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %indvars.iv6, i64 %indvars.iv8
  store double %85, double* %86, align 8
  %indvars.iv.next7 = add nsw i64 %indvars.iv6, -1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv8, i64 %indvars.iv.next7
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %85
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv8, i64 %indvars.iv.next7
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %indvars.iv.next7, i64 %indvars.iv8
  store double %92, double* %93, align 8
  %94 = icmp sgt i64 %indvars.iv.next7, 1
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, -2
  br i1 %94, label %78, label %95

; <label>:95:                                     ; preds = %78
  %96 = icmp slt i64 %indvars.iv.next9, 999
  br i1 %96, label %._crit_edge20, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %95
  %.pre26 = load double, double* %13, align 8
  %.pre27 = load [1000 x double]*, [1000 x double]** %6, align 8
  %.pre28 = load double, double* %11, align 8
  %97 = fsub double -0.000000e+00, %57
  %98 = fmul double %62, 2.000000e+00
  %99 = fadd double %98, 1.000000e+00
  br label %.lver.check

._crit_edge20:                                    ; preds = %95
  %.pre = load [1000 x double]*, [1000 x double]** %6, align 8
  br label %18

.lver.check:                                      ; preds = %171, %..preheader_crit_edge
  %indvar = phi i64 [ %100, %171 ], [ 0, %..preheader_crit_edge ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %171 ], [ 1, %..preheader_crit_edge ]
  %100 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %68, i64 %100, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %68, i64 %100, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %63, i64 %100, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %63, i64 %100, i64 999
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv15, i64 0
  store double 1.000000e+00, double* %101, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 0
  store double 0.000000e+00, double* %102, align 8
  %103 = bitcast double* %101 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15
  %106 = bitcast [1000 x double]* %105 to i64*
  store i64 %104, i64* %106, align 8
  %107 = add nsw i64 %indvars.iv15, -1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv10.lver.orig = phi i64 [ %indvars.iv.next11.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %108 = add nsw i64 %indvars.iv10.lver.orig, -1
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fmul double %44, %110
  %112 = fadd double %111, %.pre26
  %113 = fdiv double %97, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 %indvars.iv10.lver.orig
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %107, i64 %indvars.iv10.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %62, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %indvars.iv15, i64 %indvars.iv10.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %99, %119
  %121 = fsub double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %indvars.iv.next16, i64 %indvars.iv10.lver.orig
  %123 = load double, double* %122, align 8
  %124 = fmul double %.pre28, %123
  %125 = fsub double %121, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15, i64 %108
  %127 = load double, double* %126, align 8
  %128 = fmul double %44, %127
  %129 = fsub double %125, %128
  %130 = fdiv double %129, %112
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15, i64 %indvars.iv10.lver.orig
  store double %130, double* %131, align 8
  %exitcond12.lver.orig = icmp eq i64 %indvars.iv10.lver.orig, 998
  %indvars.iv.next11.lver.orig = add nuw nsw i64 %indvars.iv10.lver.orig, 1
  br i1 %exitcond12.lver.orig, label %.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial52 = load double, double* %scevgep46, align 8
  br label %132

; <label>:132:                                    ; preds = %132, %.ph
  %store_forwarded53 = phi double [ %load_initial52, %.ph ], [ %150, %132 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %135, %132 ]
  %indvars.iv10 = phi i64 [ 1, %.ph ], [ %indvars.iv.next11, %132 ]
  %133 = fmul double %44, %store_forwarded
  %134 = fadd double %133, %.pre26
  %135 = fdiv double %97, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 %indvars.iv10
  store double %135, double* %136, align 8
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %107, i64 %indvars.iv10
  %138 = load double, double* %137, align 8
  %139 = fmul double %62, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %indvars.iv15, i64 %indvars.iv10
  %141 = load double, double* %140, align 8
  %142 = fmul double %99, %141
  %143 = fsub double %142, %139
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre27, i64 %indvars.iv.next16, i64 %indvars.iv10
  %145 = load double, double* %144, align 8
  %146 = fmul double %.pre28, %145
  %147 = fsub double %143, %146
  %148 = fmul double %44, %store_forwarded53
  %149 = fsub double %147, %148
  %150 = fdiv double %149, %134
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15, i64 %indvars.iv10
  store double %150, double* %151, align 8
  %exitcond12 = icmp eq i64 %indvars.iv10, 998
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br i1 %exitcond12, label %.loopexit54, label %132

.loopexit:                                        ; preds = %.ph.lver.orig
  br label %152

.loopexit54:                                      ; preds = %132
  br label %152

; <label>:152:                                    ; preds = %.loopexit54, %.loopexit
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv15, i64 999
  store double 1.000000e+00, double* %153, align 8
  br label %154

; <label>:154:                                    ; preds = %154, %152
  %indvars.iv13 = phi i64 [ 998, %152 ], [ %indvars.iv.next14.1, %154 ]
  %155 = phi double [ 1.000000e+00, %152 ], [ %168, %154 ]
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 %indvars.iv13
  %157 = load double, double* %156, align 8
  %158 = fmul double %157, %155
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15, i64 %indvars.iv13
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv15, i64 %indvars.iv13
  store double %161, double* %162, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, -1
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %indvars.iv15, i64 %indvars.iv.next14
  %164 = load double, double* %163, align 8
  %165 = fmul double %164, %161
  %166 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %indvars.iv15, i64 %indvars.iv.next14
  %167 = load double, double* %166, align 8
  %168 = fadd double %165, %167
  %169 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %indvars.iv15, i64 %indvars.iv.next14
  store double %168, double* %169, align 8
  %170 = icmp sgt i64 %indvars.iv.next14, 1
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, -2
  br i1 %170, label %154, label %171

; <label>:171:                                    ; preds = %154
  %exitcond27 = icmp eq i64 %indvars.iv.next16, 999
  br i1 %exitcond27, label %172, label %.lver.check

; <label>:172:                                    ; preds = %171
  %173 = icmp sgt i32 %16, 499
  %174 = add nuw nsw i32 %16, 1
  br i1 %173, label %175, label %.preheader7

; <label>:175:                                    ; preds = %172
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge3
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge3

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
