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
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader

.preheader:                                       ; preds = %16, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next16, %16 ]
  %3 = add nuw nsw i64 %indvars.iv15, 1000
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %4 ]
  %5 = sub nuw nsw i64 %3, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 %3, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %16, label %4

; <label>:16:                                     ; preds = %4
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %17, label %.preheader

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader152

.preheader152:                                    ; preds = %168, %6
  %.0159 = phi i32 [ 1, %6 ], [ %170, %168 ]
  br label %.lver.check

.lver.check:                                      ; preds = %86, %.preheader152
  %indvar = phi i64 [ %7, %86 ], [ 0, %.preheader152 ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %86 ], [ 1, %.preheader152 ]
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep179 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep181 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep183 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv167
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv167, -1
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %bound0 = icmp ult double* %scevgep, %scevgep183
  %bound1 = icmp ult double* %scevgep181, %scevgep179
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = insertelement <2 x double> undef, double %17, i32 0
  %21 = insertelement <2 x double> %20, double 2.000000e+00, i32 1
  %22 = fmul <2 x double> %21, <double 0xC09F400000000001, double 0xC08F400000000001>
  %23 = fadd <2 x double> %22, <double 0x40AF420000000001, double 1.000000e+00>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = fdiv double 0x409F400000000001, %24
  store double %25, double* %18, align 8
  %26 = bitcast double* %19 to <2 x double>*
  %27 = load <2 x double>, <2 x double>* %26, align 8
  %28 = insertelement <2 x double> %23, double 0xC08F400000000001, i32 0
  %29 = fmul <2 x double> %27, %28
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %31, %30
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next168
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC08F400000000001
  %36 = fsub double %32, %35
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %15
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, 0xC09F400000000001
  %40 = fsub double %36, %39
  %41 = fdiv double %40, %24
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv.lver.orig
  store double %41, double* %42, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit212, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial187 = load double, double* %scevgep181, align 8
  br label %43

; <label>:43:                                     ; preds = %43, %.ph
  %store_forwarded188 = phi double [ %load_initial187, %.ph ], [ %65, %43 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %51, %43 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %43 ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %46 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %47 = insertelement <2 x double> %46, double 2.000000e+00, i32 1
  %48 = fmul <2 x double> %47, <double 0xC09F400000000001, double 0xC08F400000000001>
  %49 = fadd <2 x double> %48, <double 0x40AF420000000001, double 1.000000e+00>
  %50 = extractelement <2 x double> %49, i32 0
  %51 = fdiv double 0x409F400000000001, %50
  store double %51, double* %44, align 8
  %52 = bitcast double* %45 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = insertelement <2 x double> %49, double 0xC08F400000000001, i32 0
  %55 = fmul <2 x double> %53, %54
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = fsub double %57, %56
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next168
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, 0xC08F400000000001
  %62 = fsub double %58, %61
  %63 = fmul double %store_forwarded188, 0xC09F400000000001
  %64 = fsub double %62, %63
  %65 = fdiv double %64, %50
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv
  store double %65, double* %66, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit213, label %43

.loopexit212:                                     ; preds = %.ph.lver.orig
  br label %67

.loopexit213:                                     ; preds = %43
  br label %67

; <label>:67:                                     ; preds = %.loopexit213, %.loopexit212
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv167
  store double 1.000000e+00, double* %68, align 8
  br label %69

; <label>:69:                                     ; preds = %69, %67
  %indvars.iv165 = phi i64 [ 998, %67 ], [ %indvars.iv.next166.1, %69 ]
  %70 = phi double [ 1.000000e+00, %67 ], [ %83, %69 ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv165
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %70
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv165
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv165, i64 %indvars.iv167
  store double %76, double* %77, align 8
  %indvars.iv.next166 = add nsw i64 %indvars.iv165, -1
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv.next166
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %76
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv.next166
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next166, i64 %indvars.iv167
  store double %83, double* %84, align 8
  %85 = icmp sgt i64 %indvars.iv.next166, 1
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, -2
  br i1 %85, label %69, label %86

; <label>:86:                                     ; preds = %69
  %exitcond176 = icmp eq i64 %indvars.iv.next168, 999
  br i1 %exitcond176, label %.lver.check203.preheader, label %.lver.check

.lver.check203.preheader:                         ; preds = %86
  br label %.lver.check203

.lver.check203:                                   ; preds = %.lver.check203.preheader, %167
  %indvar189 = phi i64 [ %87, %167 ], [ 0, %.lver.check203.preheader ]
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %167 ], [ 1, %.lver.check203.preheader ]
  %87 = add i64 %indvar189, 1
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 0
  %scevgep193 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 999
  %scevgep195 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 0
  %scevgep197 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 999
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %88, i64 0, i64 0
  store double 1.000000e+00, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 0
  store double 0.000000e+00, double* %90, align 8
  %91 = bitcast [1000 x double]* %88 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174
  %94 = bitcast [1000 x double]* %93 to i64*
  store i64 %92, i64* %94, align 8
  %95 = add nsw i64 %indvars.iv174, -1
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %bound0199 = icmp ult double* %scevgep191, %scevgep197
  %bound1200 = icmp ult double* %scevgep195, %scevgep193
  %memcheck.conflict202 = and i1 %bound0199, %bound1200
  br i1 %memcheck.conflict202, label %.ph204.lver.orig.preheader, label %.ph204

.ph204.lver.orig.preheader:                       ; preds = %.lver.check203
  br label %.ph204.lver.orig

.ph204.lver.orig:                                 ; preds = %.ph204.lver.orig.preheader, %.ph204.lver.orig
  %indvars.iv169.lver.orig = phi i64 [ %indvars.iv.next170.lver.orig, %.ph204.lver.orig ], [ 1, %.ph204.lver.orig.preheader ]
  %96 = add nsw i64 %indvars.iv169.lver.orig, -1
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %96
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv169.lver.orig
  %101 = insertelement <2 x double> undef, double %98, i32 0
  %102 = insertelement <2 x double> %101, double 2.000000e+00, i32 1
  %103 = fmul <2 x double> %102, <double 0xC08F400000000001, double 0xC09F400000000001>
  %104 = fadd <2 x double> %103, <double 0x409F440000000001, double 1.000000e+00>
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fdiv double 0x408F400000000001, %105
  store double %107, double* %99, align 8
  %108 = load double, double* %100, align 8
  %109 = fmul double %108, 0xC09F400000000001
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %106
  %113 = fsub double %112, %109
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv169.lver.orig
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, 0xC09F400000000001
  %117 = fsub double %113, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %96
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, 0xC08F400000000001
  %121 = fsub double %117, %120
  %122 = fdiv double %121, %105
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  store double %122, double* %123, align 8
  %exitcond171.lver.orig = icmp eq i64 %indvars.iv169.lver.orig, 998
  %indvars.iv.next170.lver.orig = add nuw nsw i64 %indvars.iv169.lver.orig, 1
  br i1 %exitcond171.lver.orig, label %.loopexit, label %.ph204.lver.orig

.ph204:                                           ; preds = %.lver.check203
  %load_initial206 = load double, double* %scevgep191, align 8
  %load_initial209 = load double, double* %scevgep195, align 8
  br label %124

; <label>:124:                                    ; preds = %124, %.ph204
  %store_forwarded210 = phi double [ %load_initial209, %.ph204 ], [ %146, %124 ]
  %store_forwarded207 = phi double [ %load_initial206, %.ph204 ], [ %133, %124 ]
  %indvars.iv169 = phi i64 [ 1, %.ph204 ], [ %indvars.iv.next170, %124 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv169
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv169
  %127 = insertelement <2 x double> undef, double %store_forwarded207, i32 0
  %128 = insertelement <2 x double> %127, double 2.000000e+00, i32 1
  %129 = fmul <2 x double> %128, <double 0xC08F400000000001, double 0xC09F400000000001>
  %130 = fadd <2 x double> %129, <double 0x409F440000000001, double 1.000000e+00>
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  %133 = fdiv double 0x408F400000000001, %131
  store double %133, double* %125, align 8
  %134 = load double, double* %126, align 8
  %135 = fmul double %134, 0xC09F400000000001
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv169
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, %132
  %139 = fsub double %138, %135
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv169
  %141 = load double, double* %140, align 8
  %142 = fmul double %141, 0xC09F400000000001
  %143 = fsub double %139, %142
  %144 = fmul double %store_forwarded210, 0xC08F400000000001
  %145 = fsub double %143, %144
  %146 = fdiv double %145, %131
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv169
  store double %146, double* %147, align 8
  %exitcond171 = icmp eq i64 %indvars.iv169, 998
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  br i1 %exitcond171, label %.loopexit211, label %124

.loopexit:                                        ; preds = %.ph204.lver.orig
  br label %148

.loopexit211:                                     ; preds = %124
  br label %148

; <label>:148:                                    ; preds = %.loopexit211, %.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %150

; <label>:150:                                    ; preds = %150, %148
  %indvars.iv172 = phi i64 [ 998, %148 ], [ %indvars.iv.next173.1, %150 ]
  %151 = phi double [ 1.000000e+00, %148 ], [ %164, %150 ]
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv172
  %153 = load double, double* %152, align 8
  %154 = fmul double %153, %151
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv172
  %156 = load double, double* %155, align 8
  %157 = fadd double %154, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 %indvars.iv172
  store double %157, double* %158, align 8
  %indvars.iv.next173 = add nsw i64 %indvars.iv172, -1
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv.next173
  %160 = load double, double* %159, align 8
  %161 = fmul double %160, %157
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv.next173
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 %indvars.iv.next173
  store double %164, double* %165, align 8
  %166 = icmp sgt i64 %indvars.iv.next173, 1
  %indvars.iv.next173.1 = add nsw i64 %indvars.iv172, -2
  br i1 %166, label %150, label %167

; <label>:167:                                    ; preds = %150
  %exitcond177 = icmp eq i64 %indvars.iv.next175, 999
  br i1 %exitcond177, label %168, label %.lver.check203

; <label>:168:                                    ; preds = %167
  %169 = icmp sgt i32 %.0159, 499
  %170 = add nuw nsw i32 %.0159, 1
  br i1 %169, label %171, label %.preheader152

; <label>:171:                                    ; preds = %168
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next16, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge14
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge14

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
