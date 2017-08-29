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
  %indvars.iv14 = phi i64 [ 0, %2 ], [ %indvars.iv.next15, %16 ]
  %3 = add nuw nsw i64 %indvars.iv14, 1000
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %4 ]
  %5 = sub nuw nsw i64 %3, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
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
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %17, label %.preheader

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader152

.preheader152:                                    ; preds = %169, %6
  %.0159 = phi i32 [ 1, %6 ], [ %171, %169 ]
  br label %.lver.check

.lver.check:                                      ; preds = %87, %.preheader152
  %indvar = phi i64 [ %indvar.next, %87 ], [ 0, %.preheader152 ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %87 ], [ 1, %.preheader152 ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep179 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep181 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep183 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv167
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv167, -1
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %bound0 = icmp ult double* %scevgep, %scevgep183
  %bound1 = icmp ult double* %scevgep181, %scevgep179
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv.lver.orig
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %15
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next168
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %16
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = fmul <2 x double> %24, <double 0xC09F400000000001, double 0xC09F400000000001>
  %26 = fadd <2 x double> %25, <double 0x40AF420000000001, double 0x40AF420000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fdiv double 0x409F400000000001, %27
  store double %29, double* %19, align 8
  %30 = bitcast double* %20 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %30, align 8
  %32 = fmul <2 x double> %31, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %34, %33
  %36 = load double, double* %21, align 8
  %37 = fmul double %36, 0xC08F400000000001
  %38 = fsub double %35, %37
  %39 = load double, double* %22, align 8
  %40 = fmul double %39, 0xC09F400000000001
  %41 = fsub double %38, %40
  %42 = fdiv double %41, %28
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv.lver.orig
  store double %42, double* %43, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit212, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep186 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep185 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep185, align 8
  %load_initial187 = load double, double* %scevgep186, align 8
  br label %44

; <label>:44:                                     ; preds = %44, %.ph
  %store_forwarded188 = phi double [ %load_initial187, %.ph ], [ %66, %44 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %54, %44 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %44 ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %15
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next168
  %48 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %49, <double 0xC09F400000000001, double 0xC09F400000000001>
  %51 = fadd <2 x double> %50, <double 0x40AF420000000001, double 0x40AF420000000001>
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fdiv double 0x409F400000000001, %52
  store double %54, double* %45, align 8
  %55 = bitcast double* %46 to <2 x double>*
  %56 = load <2 x double>, <2 x double>* %55, align 8
  %57 = fmul <2 x double> %56, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %60 = fsub double %59, %58
  %61 = load double, double* %47, align 8
  %62 = fmul double %61, 0xC08F400000000001
  %63 = fsub double %60, %62
  %64 = fmul double %store_forwarded188, 0xC09F400000000001
  %65 = fsub double %63, %64
  %66 = fdiv double %65, %53
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv
  store double %66, double* %67, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit213, label %44

.loopexit212:                                     ; preds = %.ph.lver.orig
  br label %68

.loopexit213:                                     ; preds = %44
  br label %68

; <label>:68:                                     ; preds = %.loopexit213, %.loopexit212
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv167
  store double 1.000000e+00, double* %69, align 8
  br label %70

; <label>:70:                                     ; preds = %70, %68
  %indvars.iv165 = phi i64 [ 998, %68 ], [ %indvars.iv.next166.1, %70 ]
  %71 = phi double [ 1.000000e+00, %68 ], [ %84, %70 ]
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv165
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %71
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv165
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv165, i64 %indvars.iv167
  store double %77, double* %78, align 8
  %indvars.iv.next166 = add nsw i64 %indvars.iv165, -1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv167, i64 %indvars.iv.next166
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %77
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv167, i64 %indvars.iv.next166
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next166, i64 %indvars.iv167
  store double %84, double* %85, align 8
  %86 = icmp sgt i64 %indvars.iv.next166, 1
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, -2
  br i1 %86, label %70, label %87

; <label>:87:                                     ; preds = %70
  %exitcond176 = icmp eq i64 %indvars.iv.next168, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond176, label %.lver.check203.preheader, label %.lver.check

.lver.check203.preheader:                         ; preds = %87
  br label %.lver.check203

.lver.check203:                                   ; preds = %.lver.check203.preheader, %168
  %indvar189 = phi i64 [ %indvar.next190, %168 ], [ 0, %.lver.check203.preheader ]
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %168 ], [ 1, %.lver.check203.preheader ]
  %88 = add i64 %indvar189, 1
  %89 = add i64 %indvar189, 1
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %4, i64 %89, i64 0
  %scevgep193 = getelementptr [1000 x double], [1000 x double]* %4, i64 %89, i64 999
  %scevgep195 = getelementptr [1000 x double], [1000 x double]* %5, i64 %89, i64 0
  %scevgep197 = getelementptr [1000 x double], [1000 x double]* %5, i64 %89, i64 999
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 0
  store double 1.000000e+00, double* %90, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 0
  store double 0.000000e+00, double* %91, align 8
  %92 = bitcast double* %90 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174
  %95 = bitcast [1000 x double]* %94 to i64*
  store i64 %93, i64* %95, align 8
  %96 = add nsw i64 %indvars.iv174, -1
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %bound0199 = icmp ult double* %scevgep191, %scevgep197
  %bound1200 = icmp ult double* %scevgep195, %scevgep193
  %memcheck.conflict202 = and i1 %bound0199, %bound1200
  br i1 %memcheck.conflict202, label %.ph204.lver.orig.preheader, label %.ph204

.ph204.lver.orig.preheader:                       ; preds = %.lver.check203
  br label %.ph204.lver.orig

.ph204.lver.orig:                                 ; preds = %.ph204.lver.orig.preheader, %.ph204.lver.orig
  %indvars.iv169.lver.orig = phi i64 [ %indvars.iv.next170.lver.orig, %.ph204.lver.orig ], [ 1, %.ph204.lver.orig.preheader ]
  %97 = add nsw i64 %indvars.iv169.lver.orig, -1
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %97
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %96, i64 %indvars.iv169.lver.orig
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv169.lver.orig
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %97
  %105 = insertelement <2 x double> undef, double %99, i32 0
  %106 = shufflevector <2 x double> %105, <2 x double> undef, <2 x i32> zeroinitializer
  %107 = fmul <2 x double> %106, <double 0xC08F400000000001, double 0xC08F400000000001>
  %108 = fadd <2 x double> %107, <double 0x409F440000000001, double 0x409F440000000001>
  %109 = extractelement <2 x double> %108, i32 0
  %110 = extractelement <2 x double> %108, i32 1
  %111 = fdiv double 0x408F400000000001, %109
  store double %111, double* %100, align 8
  %112 = load double, double* %101, align 8
  %113 = fmul double %112, 0xC09F400000000001
  %114 = load double, double* %102, align 8
  %115 = fmul double %114, 0xC0AF3E0000000001
  %116 = fsub double %115, %113
  %117 = load double, double* %103, align 8
  %118 = fmul double %117, 0xC09F400000000001
  %119 = fsub double %116, %118
  %120 = load double, double* %104, align 8
  %121 = fmul double %120, 0xC08F400000000001
  %122 = fsub double %119, %121
  %123 = fdiv double %122, %110
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv169.lver.orig
  store double %123, double* %124, align 8
  %exitcond171.lver.orig = icmp eq i64 %indvars.iv169.lver.orig, 998
  %indvars.iv.next170.lver.orig = add nuw nsw i64 %indvars.iv169.lver.orig, 1
  br i1 %exitcond171.lver.orig, label %.loopexit, label %.ph204.lver.orig

.ph204:                                           ; preds = %.lver.check203
  %scevgep208 = getelementptr [1000 x double], [1000 x double]* %5, i64 %88, i64 0
  %scevgep205 = getelementptr [1000 x double], [1000 x double]* %4, i64 %88, i64 0
  %load_initial206 = load double, double* %scevgep205, align 8
  %load_initial209 = load double, double* %scevgep208, align 8
  br label %125

; <label>:125:                                    ; preds = %125, %.ph204
  %store_forwarded210 = phi double [ %load_initial209, %.ph204 ], [ %147, %125 ]
  %store_forwarded207 = phi double [ %load_initial206, %.ph204 ], [ %136, %125 ]
  %indvars.iv169 = phi i64 [ 1, %.ph204 ], [ %indvars.iv.next170, %125 ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv169
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %96, i64 %indvars.iv169
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv169
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv169
  %130 = insertelement <2 x double> undef, double %store_forwarded207, i32 0
  %131 = shufflevector <2 x double> %130, <2 x double> undef, <2 x i32> zeroinitializer
  %132 = fmul <2 x double> %131, <double 0xC08F400000000001, double 0xC08F400000000001>
  %133 = fadd <2 x double> %132, <double 0x409F440000000001, double 0x409F440000000001>
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fdiv double 0x408F400000000001, %134
  store double %136, double* %126, align 8
  %137 = load double, double* %127, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = load double, double* %128, align 8
  %140 = fmul double %139, 0xC0AF3E0000000001
  %141 = fsub double %140, %138
  %142 = load double, double* %129, align 8
  %143 = fmul double %142, 0xC09F400000000001
  %144 = fsub double %141, %143
  %145 = fmul double %store_forwarded210, 0xC08F400000000001
  %146 = fsub double %144, %145
  %147 = fdiv double %146, %135
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv169
  store double %147, double* %148, align 8
  %exitcond171 = icmp eq i64 %indvars.iv169, 998
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  br i1 %exitcond171, label %.loopexit211, label %125

.loopexit:                                        ; preds = %.ph204.lver.orig
  br label %149

.loopexit211:                                     ; preds = %125
  br label %149

; <label>:149:                                    ; preds = %.loopexit211, %.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %151

; <label>:151:                                    ; preds = %151, %149
  %indvars.iv172 = phi i64 [ 998, %149 ], [ %indvars.iv.next173.1, %151 ]
  %152 = phi double [ 1.000000e+00, %149 ], [ %165, %151 ]
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv172
  %154 = load double, double* %153, align 8
  %155 = fmul double %154, %152
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv172
  %157 = load double, double* %156, align 8
  %158 = fadd double %155, %157
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 %indvars.iv172
  store double %158, double* %159, align 8
  %indvars.iv.next173 = add nsw i64 %indvars.iv172, -1
  %160 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv.next173
  %161 = load double, double* %160, align 8
  %162 = fmul double %161, %158
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv174, i64 %indvars.iv.next173
  %164 = load double, double* %163, align 8
  %165 = fadd double %162, %164
  %166 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv174, i64 %indvars.iv.next173
  store double %165, double* %166, align 8
  %167 = icmp sgt i64 %indvars.iv.next173, 1
  %indvars.iv.next173.1 = add nsw i64 %indvars.iv172, -2
  br i1 %167, label %151, label %168

; <label>:168:                                    ; preds = %151
  %exitcond177 = icmp eq i64 %indvars.iv.next175, 999
  %indvar.next190 = add i64 %indvar189, 1
  br i1 %exitcond177, label %169, label %.lver.check203

; <label>:169:                                    ; preds = %168
  %170 = icmp sgt i32 %.0159, 499
  %171 = add nuw nsw i32 %.0159, 1
  br i1 %170, label %172, label %.preheader152

; <label>:172:                                    ; preds = %169
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
  %indvars.iv14 = phi i64 [ 0, %2 ], [ %indvars.iv.next15, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge13
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge13

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %19, label %.preheader

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
