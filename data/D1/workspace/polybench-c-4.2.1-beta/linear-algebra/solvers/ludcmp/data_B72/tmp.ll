; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge147

._crit_edge147:                                   ; preds = %._crit_edge147, %5
  %indvars.iv114130 = phi i64 [ 0, %5 ], [ %indvars.iv.next115.1, %._crit_edge147 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv114130
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv114130
  %9 = bitcast double* %8 to <2 x double>*
  %10 = trunc i64 %indvars.iv114130 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv114130
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114130, 2
  %14 = trunc i64 %indvars.iv.next115.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond116.1 = icmp eq i64 %indvars.iv.next115.1, 2000
  br i1 %exitcond116.1, label %._crit_edge132.preheader, label %._crit_edge147

._crit_edge132.preheader:                         ; preds = %._crit_edge147
  br label %._crit_edge132

._crit_edge132:                                   ; preds = %._crit_edge132.preheader, %._crit_edge
  %indvars.iv109129 = phi i64 [ %indvars.iv.next110, %._crit_edge ], [ 1, %._crit_edge132.preheader ]
  %indvars.iv111128 = phi i64 [ %indvars.iv.next112, %._crit_edge ], [ 0, %._crit_edge132.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv111128, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %23
  %24 = mul nsw i64 %indvars.iv111128, -8
  %25 = add nsw i64 %24, 15992
  br label %._crit_edge148

._crit_edge148:                                   ; preds = %._crit_edge148, %._crit_edge132
  %indvars.iv99124 = phi i64 [ 0, %._crit_edge132 ], [ %indvars.iv.next100, %._crit_edge148 ]
  %26 = sub nsw i64 0, %indvars.iv99124
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111128, i64 %indvars.iv99124
  store double %31, double* %32, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99124, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next100, %indvars.iv109129
  br i1 %exitcond103, label %33, label %._crit_edge148

; <label>:33:                                     ; preds = %._crit_edge148
  %exitcond108126 = icmp eq i64 %indvars.iv111128, 1999
  br i1 %exitcond108126, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %33
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 1999, i64 1999
  store double 1.000000e+00, double* %34, align 8
  br label %.loopexit

._crit_edge:                                      ; preds = %33
  %35 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111128, i64 %indvars.iv111128
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111128, 1
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109129, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond113, label %.loopexit.loopexit, label %._crit_edge132

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.thread
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 32000000, i32 8, i1 false)
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge151

._crit_edge151:                                   ; preds = %55, %.loopexit
  %indvars.iv90121 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next91, %55 ]
  br label %._crit_edge150

._crit_edge150:                                   ; preds = %54, %._crit_edge151
  %indvars.iv87120 = phi i64 [ 0, %._crit_edge151 ], [ %indvars.iv.next88, %54 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87120, i64 %indvars.iv90121
  br label %._crit_edge149

._crit_edge149:                                   ; preds = %._crit_edge149, %._crit_edge150
  %indvars.iv84119 = phi i64 [ 0, %._crit_edge150 ], [ %indvars.iv.next85.1, %._crit_edge149 ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84119, i64 %indvars.iv90121
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv87120, i64 %indvars.iv84119
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next85 = or i64 %indvars.iv84119, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next85, i64 %indvars.iv90121
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv87120, i64 %indvars.iv.next85
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84119, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next85.1, 2000
  br i1 %exitcond86.1, label %54, label %._crit_edge149

; <label>:54:                                     ; preds = %._crit_edge149
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87120, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next88, 2000
  br i1 %exitcond89, label %55, label %._crit_edge150

; <label>:55:                                     ; preds = %54
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90121, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next91, 2000
  br i1 %exitcond92, label %.preheader.preheader, label %._crit_edge151

.preheader.preheader:                             ; preds = %55
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %81
  %indvars.iv81118 = phi i64 [ %indvars.iv.next82, %81 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge152

._crit_edge152:                                   ; preds = %._crit_edge152, %.preheader
  %indvars.iv117 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %._crit_edge152 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv81118, i64 %indvars.iv117
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81118, i64 %indvars.iv117
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv117, 1
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv81118, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81118, i64 %indvars.iv.next
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv117, 2
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv81118, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81118, i64 %indvars.iv.next.1
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv117, 3
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv81118, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81118, i64 %indvars.iv.next.2
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv117, 4
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv81118, i64 %indvars.iv.next.3
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81118, i64 %indvars.iv.next.3
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv117, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %81, label %._crit_edge152

; <label>:81:                                     ; preds = %._crit_edge152
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81118, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond83, label %82, label %.preheader

; <label>:82:                                     ; preds = %81
  tail call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge172._crit_edge

._crit_edge172._crit_edge:                        ; preds = %._crit_edge172, %5
  %indvars.iv124173 = phi i64 [ 0, %5 ], [ %indvars.iv.next125, %._crit_edge172 ]
  %6 = sub i64 1999, %indvars.iv124173
  %exitcond113156 = icmp eq i64 %indvars.iv124173, 0
  br i1 %exitcond113156, label %.lr.ph171..lr.ph171.split_crit_edge, label %.lr.ph159.preheader

.lr.ph159.preheader:                              ; preds = %._crit_edge172._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124173, i64 0
  br label %.lr.ph159

.lr.ph159:                                        ; preds = %._crit_edge154, %.lr.ph159.preheader
  %indvars.iv108157 = phi i64 [ 0, %.lr.ph159.preheader ], [ %indvars.iv.next109, %._crit_edge154 ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124173, i64 %indvars.iv108157
  %9 = load double, double* %8, align 8
  %exitcond107149 = icmp eq i64 %indvars.iv108157, 0
  br i1 %exitcond107149, label %._crit_edge154, label %.lr.ph159..lr.ph153_crit_edge

.lr.ph159..lr.ph153_crit_edge:                    ; preds = %.lr.ph159
  %xtraiter184 = and i64 %indvars.iv108157, 1
  %lcmp.mod185 = icmp eq i64 %xtraiter184, 0
  br i1 %lcmp.mod185, label %.lr.ph153.prol.loopexit, label %.lr.ph153.prol

.lr.ph153.prol:                                   ; preds = %.lr.ph159..lr.ph153_crit_edge
  %10 = load double, double* %7, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv108157
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %9, %13
  br label %.lr.ph153.prol.loopexit

.lr.ph153.prol.loopexit:                          ; preds = %.lr.ph159..lr.ph153_crit_edge, %.lr.ph153.prol
  %.lcssa179.unr.ph = phi double [ %14, %.lr.ph153.prol ], [ undef, %.lr.ph159..lr.ph153_crit_edge ]
  %.0151.unr.ph = phi double [ %14, %.lr.ph153.prol ], [ %9, %.lr.ph159..lr.ph153_crit_edge ]
  %indvars.iv103150.unr.ph = phi i64 [ 1, %.lr.ph153.prol ], [ 0, %.lr.ph159..lr.ph153_crit_edge ]
  %15 = icmp eq i64 %indvars.iv108157, 1
  br i1 %15, label %._crit_edge154, label %.lr.ph153.preheader

.lr.ph153.preheader:                              ; preds = %.lr.ph153.prol.loopexit
  br label %.lr.ph153

.lr.ph153:                                        ; preds = %.lr.ph153.preheader, %.lr.ph153
  %.0151 = phi double [ %29, %.lr.ph153 ], [ %.0151.unr.ph, %.lr.ph153.preheader ]
  %indvars.iv103150 = phi i64 [ %indvars.iv.next104.1, %.lr.ph153 ], [ %indvars.iv103150.unr.ph, %.lr.ph153.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124173, i64 %indvars.iv103150
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103150, i64 %indvars.iv108157
  %19 = load double, double* %18, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103150, 1
  %20 = load <2 x double>, <2 x double>* %17, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next104, i64 %indvars.iv108157
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %19, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %20, %24
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %.0151, %26
  %29 = fsub double %28, %27
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103150, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next104.1, %indvars.iv108157
  br i1 %exitcond107.1, label %._crit_edge154.loopexit, label %.lr.ph153

._crit_edge154.loopexit:                          ; preds = %.lr.ph153
  br label %._crit_edge154

._crit_edge154:                                   ; preds = %._crit_edge154.loopexit, %.lr.ph153.prol.loopexit, %.lr.ph159
  %.0.lcssa = phi double [ %9, %.lr.ph159 ], [ %.lcssa179.unr.ph, %.lr.ph153.prol.loopexit ], [ %29, %._crit_edge154.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108157, i64 %indvars.iv108157
  %31 = load double, double* %30, align 8
  %32 = fdiv double %.0.lcssa, %31
  store double %32, double* %8, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108157, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next109, %indvars.iv124173
  br i1 %exitcond113, label %.lr.ph171.split.us.preheader, label %.lr.ph159

.lr.ph171.split.us.preheader:                     ; preds = %._crit_edge154
  %xtraiter186 = and i64 %indvars.iv124173, 1
  %33 = icmp eq i64 %xtraiter186, 0
  %34 = icmp eq i64 %indvars.iv124173, 1
  br label %.lr.ph171.split.us

.lr.ph171..lr.ph171.split_crit_edge:              ; preds = %._crit_edge172._crit_edge
  br i1 true, label %.lr.ph171.split.prol.loopexit, label %.lr.ph171.split.prol.preheader

.lr.ph171.split.prol.preheader:                   ; preds = %.lr.ph171..lr.ph171.split_crit_edge
  br label %.lr.ph171.split.prol

.lr.ph171.split.prol:                             ; preds = %.lr.ph171.split.prol.preheader, %.lr.ph171.split.prol
  br i1 true, label %.lr.ph171.split.prol.loopexit.loopexit, label %.lr.ph171.split.prol, !llvm.loop !1

.lr.ph171.split.prol.loopexit.loopexit:           ; preds = %.lr.ph171.split.prol
  br label %.lr.ph171.split.prol.loopexit

.lr.ph171.split.prol.loopexit:                    ; preds = %.lr.ph171.split.prol.loopexit.loopexit, %.lr.ph171..lr.ph171.split_crit_edge
  %35 = icmp ult i64 %6, 3
  br i1 %35, label %._crit_edge172, label %.lr.ph171.split.preheader

.lr.ph171.split.preheader:                        ; preds = %.lr.ph171.split.prol.loopexit
  br label %.lr.ph171.split

.lr.ph171.split.us:                               ; preds = %._crit_edge166.us, %.lr.ph171.split.us.preheader
  %indvars.iv121169.us = phi i64 [ %indvars.iv124173, %.lr.ph171.split.us.preheader ], [ %indvars.iv.next122.us, %._crit_edge166.us ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124173, i64 %indvars.iv121169.us
  %37 = load double, double* %36, align 8
  br i1 %33, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph171.split.us
  %38 = load double, double* %7, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv121169.us
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %37, %41
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph171.split.us, %.prol.preheader
  %.lcssa180.unr.ph = phi double [ %42, %.prol.preheader ], [ undef, %.lr.ph171.split.us ]
  %.1163.us.unr.ph = phi double [ %42, %.prol.preheader ], [ %37, %.lr.ph171.split.us ]
  %indvars.iv114162.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph171.split.us ]
  br i1 %34, label %._crit_edge166.us, label %.lr.ph171.split.us.new.preheader

.lr.ph171.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph171.split.us.new

.lr.ph171.split.us.new:                           ; preds = %.lr.ph171.split.us.new.preheader, %.lr.ph171.split.us.new
  %.1163.us = phi double [ %56, %.lr.ph171.split.us.new ], [ %.1163.us.unr.ph, %.lr.ph171.split.us.new.preheader ]
  %indvars.iv114162.us = phi i64 [ %indvars.iv.next115.us.1, %.lr.ph171.split.us.new ], [ %indvars.iv114162.us.unr.ph, %.lr.ph171.split.us.new.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv124173, i64 %indvars.iv114162.us
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114162.us, i64 %indvars.iv121169.us
  %46 = load double, double* %45, align 8
  %indvars.iv.next115.us = add nuw nsw i64 %indvars.iv114162.us, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next115.us, i64 %indvars.iv121169.us
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.1163.us, %53
  %56 = fsub double %55, %54
  %indvars.iv.next115.us.1 = add nsw i64 %indvars.iv114162.us, 2
  %exitcond118.us.1 = icmp eq i64 %indvars.iv.next115.us.1, %indvars.iv124173
  br i1 %exitcond118.us.1, label %._crit_edge166.us.loopexit, label %.lr.ph171.split.us.new

._crit_edge166.us.loopexit:                       ; preds = %.lr.ph171.split.us.new
  br label %._crit_edge166.us

._crit_edge166.us:                                ; preds = %._crit_edge166.us.loopexit, %.prol.loopexit
  %.lcssa180 = phi double [ %.lcssa180.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge166.us.loopexit ]
  store double %.lcssa180, double* %36, align 8
  %indvars.iv.next122.us = add nuw nsw i64 %indvars.iv121169.us, 1
  %exitcond123.us = icmp eq i64 %indvars.iv.next122.us, 2000
  br i1 %exitcond123.us, label %._crit_edge172.loopexit212, label %.lr.ph171.split.us

.lr.ph171.split:                                  ; preds = %.lr.ph171.split, %.lr.ph171.split.preheader
  %indvars.iv121169 = phi i64 [ 0, %.lr.ph171.split.preheader ], [ %indvars.iv.next122.3.24, %.lr.ph171.split ]
  %indvars.iv.next122.3.24 = add nsw i64 %indvars.iv121169, 100
  %exitcond123.3.24 = icmp eq i64 %indvars.iv.next122.3.24, 2000
  br i1 %exitcond123.3.24, label %._crit_edge172.loopexit, label %.lr.ph171.split

._crit_edge172.loopexit:                          ; preds = %.lr.ph171.split
  br label %._crit_edge172

._crit_edge172.loopexit212:                       ; preds = %._crit_edge166.us
  br label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge172.loopexit212, %._crit_edge172.loopexit, %.lr.ph171.split.prol.loopexit
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124173, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next125, 2000
  br i1 %exitcond126, label %._crit_edge172._crit_edge176.preheader, label %._crit_edge172._crit_edge

._crit_edge172._crit_edge176.preheader:           ; preds = %._crit_edge172
  br label %._crit_edge172._crit_edge176

._crit_edge172._crit_edge176:                     ; preds = %._crit_edge172._crit_edge176.backedge, %._crit_edge172._crit_edge176.preheader
  %indvars.iv100148 = phi i64 [ 0, %._crit_edge172._crit_edge176.preheader ], [ %indvars.iv100148.be, %._crit_edge172._crit_edge176.backedge ]
  %57 = add nsw i64 %indvars.iv100148, -1
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv100148
  %59 = load double, double* %58, align 8
  %exitcond99141 = icmp eq i64 %indvars.iv100148, 0
  br i1 %exitcond99141, label %._crit_edge146.thread, label %..lr.ph145_crit_edge

._crit_edge146.thread:                            ; preds = %._crit_edge172._crit_edge176
  store double %59, double* %4, align 8
  br label %._crit_edge172._crit_edge176.backedge

..lr.ph145_crit_edge:                             ; preds = %._crit_edge172._crit_edge176
  %xtraiter181 = and i64 %indvars.iv100148, 3
  %lcmp.mod182 = icmp eq i64 %xtraiter181, 0
  br i1 %lcmp.mod182, label %.lr.ph145.prol.loopexit, label %.lr.ph145.prol.preheader

.lr.ph145.prol.preheader:                         ; preds = %..lr.ph145_crit_edge
  br label %.lr.ph145.prol

.lr.ph145.prol:                                   ; preds = %.lr.ph145.prol.preheader, %.lr.ph145.prol
  %.2143.prol = phi double [ %65, %.lr.ph145.prol ], [ %59, %.lr.ph145.prol.preheader ]
  %indvars.iv142.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph145.prol ], [ 0, %.lr.ph145.prol.preheader ]
  %prol.iter183 = phi i64 [ %prol.iter183.sub, %.lr.ph145.prol ], [ %xtraiter181, %.lr.ph145.prol.preheader ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100148, i64 %indvars.iv142.prol
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %4, i64 %indvars.iv142.prol
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %.2143.prol, %64
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv142.prol, 1
  %prol.iter183.sub = add i64 %prol.iter183, -1
  %prol.iter183.cmp = icmp eq i64 %prol.iter183.sub, 0
  br i1 %prol.iter183.cmp, label %.lr.ph145.prol.loopexit.loopexit, label %.lr.ph145.prol, !llvm.loop !3

.lr.ph145.prol.loopexit.loopexit:                 ; preds = %.lr.ph145.prol
  br label %.lr.ph145.prol.loopexit

.lr.ph145.prol.loopexit:                          ; preds = %.lr.ph145.prol.loopexit.loopexit, %..lr.ph145_crit_edge
  %.lcssa178.unr = phi double [ undef, %..lr.ph145_crit_edge ], [ %65, %.lr.ph145.prol.loopexit.loopexit ]
  %.2143.unr = phi double [ %59, %..lr.ph145_crit_edge ], [ %65, %.lr.ph145.prol.loopexit.loopexit ]
  %indvars.iv142.unr = phi i64 [ 0, %..lr.ph145_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph145.prol.loopexit.loopexit ]
  %66 = icmp ult i64 %57, 3
  br i1 %66, label %._crit_edge146, label %.lr.ph145.preheader

.lr.ph145.preheader:                              ; preds = %.lr.ph145.prol.loopexit
  br label %.lr.ph145

.lr.ph145:                                        ; preds = %.lr.ph145.preheader, %.lr.ph145
  %.2143 = phi double [ %88, %.lr.ph145 ], [ %.2143.unr, %.lr.ph145.preheader ]
  %indvars.iv142 = phi i64 [ %indvars.iv.next.3, %.lr.ph145 ], [ %indvars.iv142.unr, %.lr.ph145.preheader ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100148, i64 %indvars.iv142
  %68 = bitcast double* %67 to <2 x double>*
  %69 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  %70 = bitcast double* %69 to <2 x double>*
  %71 = load <2 x double>, <2 x double>* %68, align 8
  %72 = load <2 x double>, <2 x double>* %70, align 8
  %73 = fmul <2 x double> %71, %72
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = fsub double %.2143, %74
  %77 = fsub double %76, %75
  %indvars.iv.next.1 = add nsw i64 %indvars.iv142, 2
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100148, i64 %indvars.iv.next.1
  %79 = bitcast double* %78 to <2 x double>*
  %80 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %81 = bitcast double* %80 to <2 x double>*
  %82 = load <2 x double>, <2 x double>* %79, align 8
  %83 = load <2 x double>, <2 x double>* %81, align 8
  %84 = fmul <2 x double> %82, %83
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  %87 = fsub double %77, %85
  %88 = fsub double %87, %86
  %indvars.iv.next.3 = add nsw i64 %indvars.iv142, 4
  %exitcond99.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv100148
  br i1 %exitcond99.3, label %._crit_edge146.loopexit, label %.lr.ph145

._crit_edge146.loopexit:                          ; preds = %.lr.ph145
  br label %._crit_edge146

._crit_edge146:                                   ; preds = %._crit_edge146.loopexit, %.lr.ph145.prol.loopexit
  %.2.lcssa = phi double [ %.lcssa178.unr, %.lr.ph145.prol.loopexit ], [ %88, %._crit_edge146.loopexit ]
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv100148
  store double %.2.lcssa, double* %89, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100148, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next101, 2000
  br i1 %exitcond102, label %._crit_edge._crit_edge.preheader, label %._crit_edge172._crit_edge176.backedge

._crit_edge172._crit_edge176.backedge:            ; preds = %._crit_edge146, %._crit_edge146.thread
  %indvars.iv100148.be = phi i64 [ 1, %._crit_edge146.thread ], [ %indvars.iv.next101, %._crit_edge146 ]
  br label %._crit_edge172._crit_edge176

._crit_edge._crit_edge.preheader:                 ; preds = %._crit_edge146
  %90 = ptrtoint double* %4 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.preheader, %._crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %._crit_edge._crit_edge.preheader ]
  %indvars.iv.next96140 = phi i64 [ %indvars.iv.next96, %._crit_edge ], [ 1999, %._crit_edge._crit_edge.preheader ]
  %indvars.iv95139 = phi i64 [ %indvars.iv.next96140, %._crit_edge ], [ 2000, %._crit_edge._crit_edge.preheader ]
  %91 = add nsw i64 %indvar, -1
  %sunkaddr127 = shl i64 %indvars.iv95139, 3
  %sunkaddr128 = add i64 %90, %sunkaddr127
  %sunkaddr129 = add i64 %sunkaddr128, -8
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to double*
  %92 = load double, double* %sunkaddr130, align 8
  %exitcond136 = icmp eq i64 %indvars.iv95139, 2000
  br i1 %exitcond136, label %._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge._crit_edge
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.3138.prol = phi double [ %98, %.lr.ph.prol ], [ %92, %.lr.ph.prol.preheader ]
  %indvars.iv93137.prol = phi i64 [ %indvars.iv.next94.prol, %.lr.ph.prol ], [ %indvars.iv95139, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96140, i64 %indvars.iv93137.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv93137.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.3138.prol, %97
  %indvars.iv.next94.prol = add nuw nsw i64 %indvars.iv93137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !4

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %..lr.ph_crit_edge
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %.3138.unr = phi double [ %92, %..lr.ph_crit_edge ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv93137.unr = phi i64 [ %indvars.iv95139, %..lr.ph_crit_edge ], [ %indvars.iv.next94.prol, %.lr.ph.prol.loopexit.loopexit ]
  %99 = icmp ult i64 %91, 3
  br i1 %99, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.3138 = phi double [ %121, %.lr.ph ], [ %.3138.unr, %.lr.ph.preheader ]
  %indvars.iv93137 = phi i64 [ %indvars.iv.next94.3, %.lr.ph ], [ %indvars.iv93137.unr, %.lr.ph.preheader ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96140, i64 %indvars.iv93137
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv93137
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.3138, %107
  %110 = fsub double %109, %108
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93137, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96140, i64 %indvars.iv.next94.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94.1
  %114 = bitcast double* %113 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %indvars.iv.next94.3 = add nsw i64 %indvars.iv93137, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next94.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %._crit_edge._crit_edge
  %.3.lcssa = phi double [ %92, %._crit_edge._crit_edge ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %121, %._crit_edge.loopexit ]
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96140, i64 %indvars.iv.next96140
  %123 = load double, double* %122, align 8
  %124 = fdiv double %.3.lcssa, %123
  %sunkaddr208 = add i64 %sunkaddr, %sunkaddr127
  %sunkaddr209 = add i64 %sunkaddr208, -8
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to double*
  store double %124, double* %sunkaddr210, align 8
  %indvars.iv.next96 = add nsw i64 %indvars.iv.next96140, -1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %125, label %._crit_edge._crit_edge

; <label>:125:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv5 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge7

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
