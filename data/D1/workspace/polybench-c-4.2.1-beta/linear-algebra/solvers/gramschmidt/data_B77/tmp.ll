; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader27.us.preheader, label %._crit_edge33

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %.preheader27.us.preheader, %._crit_edge37.us
  %indvars.iv39.us = phi i64 [ %indvars.iv.next38.us, %._crit_edge37.us ], [ 0, %.preheader27.us.preheader ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader27.us
  %indvars.iv35.us = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next34.us, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv35.us, %indvars.iv39.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = fmul double %11, 1.000000e+02
  %13 = fadd double %12, 1.000000e+01
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39.us, i64 %indvars.iv35.us
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39.us, i64 %indvars.iv35.us
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next34.us = add nuw nsw i64 %indvars.iv35.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next34.us, 1200
  br i1 %exitcond43, label %._crit_edge37.us, label %6

._crit_edge37.us:                                 ; preds = %6
  %indvars.iv.next38.us = add nuw nsw i64 %indvars.iv39.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next38.us, 1000
  br i1 %exitcond44, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge37.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  br i1 true, label %.preheader.lr.ph, label %._crit_edge33

.preheader.lr.ph:                                 ; preds = %.preheader26
  br i1 true, label %.preheader.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next30.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv31.prol, i64 0
  %scevgep47.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.prol, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !1

.preheader.prol.loopexit.loopexit:                ; preds = %._crit_edge.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.lr.ph
  br i1 false, label %._crit_edge33, label %._crit_edge.3.preheader

._crit_edge.3.preheader:                          ; preds = %.preheader.prol.loopexit
  br i1 false, label %._crit_edge.3.prol.preheader, label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.preheader:                     ; preds = %._crit_edge.3.preheader
  br label %._crit_edge.3.prol

._crit_edge.3.prol:                               ; preds = %._crit_edge.3.prol.preheader
  %scevgep.prol53 = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 0
  %scevgep47.prol54 = bitcast double* %scevgep.prol53 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.prol54, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 1, i64 0
  %scevgep47.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.1.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 2, i64 0
  %scevgep47.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.2.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 3, i64 0
  %scevgep47.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.3.prol, i8 0, i64 9600, i32 8, i1 false)
  br label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.loopexit:                      ; preds = %._crit_edge.3.prol, %._crit_edge.3.preheader
  %indvars.iv31.unr56 = phi i64 [ 0, %._crit_edge.3.preheader ], [ 4, %._crit_edge.3.prol ]
  br i1 false, label %._crit_edge33.loopexit, label %._crit_edge.3.preheader.new

._crit_edge.3.preheader.new:                      ; preds = %._crit_edge.3.prol.loopexit
  br label %._crit_edge.3

._crit_edge33.loopexit.unr-lcssa:                 ; preds = %._crit_edge.3
  br label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge.3.prol.loopexit, %._crit_edge33.loopexit.unr-lcssa
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader27.lr.ph, %.preheader.prol.loopexit, %.preheader26
  ret void

._crit_edge.3:                                    ; preds = %._crit_edge.3, %._crit_edge.3.preheader.new
  %indvars.iv31 = phi i64 [ %indvars.iv31.unr56, %._crit_edge.3.preheader.new ], [ %indvars.iv.next30.3.1, %._crit_edge.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 0
  %scevgep47 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30, i64 0
  %scevgep47.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv31, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.1, i64 0
  %scevgep47.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.2 = add nsw i64 %indvars.iv31, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.2, i64 0
  %scevgep47.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.3 = add nsw i64 %indvars.iv31, 4
  %scevgep.157 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.3, i64 0
  %scevgep47.158 = bitcast double* %scevgep.157 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.158, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.159 = add nsw i64 %indvars.iv31, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.159, i64 0
  %scevgep47.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.1.1 = add nsw i64 %indvars.iv31, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.1.1, i64 0
  %scevgep47.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.2.1 = add nsw i64 %indvars.iv31, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next30.2.1, i64 0
  %scevgep47.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next30.3.1 = add nsw i64 %indvars.iv31, 8
  %exitcond42.3.1 = icmp eq i64 %indvars.iv.next30.3.1, 1200
  br i1 %exitcond42.3.1, label %._crit_edge33.loopexit.unr-lcssa, label %._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader77.lr.ph, label %._crit_edge102

.preheader77.lr.ph:                               ; preds = %5
  %sunkaddr169 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr = ptrtoint [1200 x double]* %4 to i64
  br label %.preheader77

.preheader77:                                     ; preds = %._crit_edge97, %.preheader77.lr.ph
  %indvars.iv98100 = phi i64 [ 0, %.preheader77.lr.ph ], [ %indvars.iv.next9394, %._crit_edge97 ]
  %6 = mul i64 %indvars.iv98100, 1201
  %7 = add i64 %6, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %7
  %8 = mul i64 %indvars.iv98100, -8
  %9 = add i64 9592, %8
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader77
  br i1 true, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.079.prol = phi double [ %13, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %indvars.iv78.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78.prol, i64 %indvars.iv98100
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %.079.prol, %12
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv78.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %13, %.lr.ph.prol.loopexit.loopexit ]
  %.079.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %13, %.lr.ph.prol.loopexit.loopexit ]
  br i1 false, label %._crit_edge, label %.lr.ph.preheader190

.lr.ph.preheader190:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader190, %.lr.ph
  %.079 = phi double [ %29, %.lr.ph ], [ %.079.unr, %.lr.ph.preheader190 ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ 0, %.lr.ph.preheader190 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv98100
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %.079, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv78, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv98100
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.1 = add nsw i64 %indvars.iv78, 2
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv98100
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.2 = add nsw i64 %indvars.iv78, 3
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv98100
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %25, %28
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv78, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader77
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader77 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %29, %._crit_edge.loopexit ]
  %30 = tail call double @sqrt(double %.0.lcssa) #4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv98100
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv98100, i64 %indvars.iv98100
  store double %30, double* %32, align 8
  br i1 true, label %.lr.ph83, label %.preheader76

.lr.ph83:                                         ; preds = %._crit_edge
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph83
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv98100
  %34 = load double, double* %33, align 8
  %sunkaddr136.prol = ptrtoint [1200 x double]* %31 to i64
  %sunkaddr137.prol = shl i64 %indvars.iv98100, 3
  %sunkaddr138.prol = add i64 %sunkaddr136.prol, %sunkaddr137.prol
  %sunkaddr139.prol = inttoptr i64 %sunkaddr138.prol to double*
  %35 = load double, double* %sunkaddr139.prol, align 8
  %36 = fdiv double %34, %35
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv98100
  store double %36, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph83
  %indvars.iv81.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph83 ]
  br i1 false, label %.preheader76, label %.lr.ph83.new.preheader

.lr.ph83.new.preheader:                           ; preds = %.prol.loopexit
  %sunkaddr181 = ptrtoint [1200 x double]* %31 to i64
  %sunkaddr182 = shl i64 %indvars.iv98100, 3
  %sunkaddr183 = add i64 %sunkaddr181, %sunkaddr182
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  br label %.lr.ph83.new

.preheader76.loopexit:                            ; preds = %.lr.ph83.new
  br label %.preheader76

.preheader76:                                     ; preds = %.preheader76.loopexit, %.prol.loopexit, %._crit_edge
  %indvars.iv.next9394 = add nuw nsw i64 %indvars.iv98100, 1
  %38 = icmp slt i64 %indvars.iv.next9394, 1200
  br i1 %38, label %.lr.ph96, label %._crit_edge97

.lr.ph96:                                         ; preds = %.preheader76
  br i1 true, label %.lr.ph96.split.us.preheader, label %._crit_edge97.loopexit140

.lr.ph96.split.us.preheader:                      ; preds = %.lr.ph96
  %sunkaddr173 = ptrtoint [1200 x double]* %31 to i64
  %39 = ptrtoint [1200 x double]* %31 to i64
  %sunkaddr170 = shl i64 %indvars.iv98100, 3
  %sunkaddr171 = add i64 %sunkaddr169, %sunkaddr170
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  %sunkaddr161 = ptrtoint [1200 x double]* %31 to i64
  %40 = ptrtoint [1200 x double]* %31 to i64
  %sunkaddr158 = shl i64 %indvars.iv98100, 3
  %sunkaddr159 = add i64 %sunkaddr, %sunkaddr158
  %sunkaddr160 = inttoptr i64 %sunkaddr159 to double*
  br label %.lr.ph96.split.us

.lr.ph96.split.us:                                ; preds = %.lr.ph96.split.us.preheader, %.loopexit.us
  %indvars.iv.next9395.us = phi i64 [ %indvars.iv.next93.us, %.loopexit.us ], [ %indvars.iv.next9394, %.lr.ph96.split.us.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv98100, i64 %indvars.iv.next9395.us
  store double 0.000000e+00, double* %41, align 8
  br i1 true, label %.prol.loopexit145, label %.prol.preheader144

.prol.preheader144:                               ; preds = %.lr.ph96.split.us
  %42 = load double, double* %sunkaddr160, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv.next9395.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %45, 0.000000e+00
  %sunkaddr129.prol = shl i64 %indvars.iv.next9395.us, 3
  %sunkaddr130.prol = add i64 %40, %sunkaddr129.prol
  %sunkaddr131.prol = inttoptr i64 %sunkaddr130.prol to double*
  store double %46, double* %sunkaddr131.prol, align 8
  br label %.prol.loopexit145

.prol.loopexit145:                                ; preds = %.prol.preheader144, %.lr.ph96.split.us
  %.unr.ph = phi double [ %46, %.prol.preheader144 ], [ 0.000000e+00, %.lr.ph96.split.us ]
  %indvars.iv85.us.unr.ph = phi i64 [ 1, %.prol.preheader144 ], [ 0, %.lr.ph96.split.us ]
  br i1 false, label %.lr.ph90.us, label %.lr.ph96.split.us.new.preheader

.lr.ph96.split.us.new.preheader:                  ; preds = %.prol.loopexit145
  %sunkaddr162 = shl i64 %indvars.iv.next9395.us, 3
  %sunkaddr163 = add i64 %sunkaddr161, %sunkaddr162
  %sunkaddr164 = inttoptr i64 %sunkaddr163 to double*
  br label %.lr.ph96.split.us.new

.lr.ph96.split.us.new:                            ; preds = %.lr.ph96.split.us.new.preheader, %.lr.ph96.split.us.new
  %47 = phi double [ %59, %.lr.ph96.split.us.new ], [ %.unr.ph, %.lr.ph96.split.us.new.preheader ]
  %indvars.iv85.us = phi i64 [ %indvars.iv.next84.us.1, %.lr.ph96.split.us.new ], [ %indvars.iv85.us.unr.ph, %.lr.ph96.split.us.new.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv85.us, i64 %indvars.iv98100
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85.us, i64 %indvars.iv.next9395.us
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %sunkaddr164, align 8
  %indvars.iv.next84.us = add nuw nsw i64 %indvars.iv85.us, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next84.us, i64 %indvars.iv98100
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next84.us, i64 %indvars.iv.next9395.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %sunkaddr164, align 8
  %indvars.iv.next84.us.1 = add nuw nsw i64 %indvars.iv85.us, 2
  %exitcond124.1 = icmp eq i64 %indvars.iv.next84.us.1, 1000
  br i1 %exitcond124.1, label %.lr.ph90.us.loopexit, label %.lr.ph96.split.us.new

.lr.ph90.us.loopexit:                             ; preds = %.lr.ph96.split.us.new
  br label %.lr.ph90.us

.lr.ph90.us:                                      ; preds = %.lr.ph90.us.loopexit, %.prol.loopexit145
  br i1 true, label %.prol.loopexit149, label %.prol.preheader148

.prol.preheader148:                               ; preds = %.lr.ph90.us
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv.next9395.us
  %61 = load double, double* %60, align 8
  %62 = load double, double* %sunkaddr172, align 8
  %sunkaddr133.prol = shl i64 %indvars.iv.next9395.us, 3
  %sunkaddr134.prol = add i64 %39, %sunkaddr133.prol
  %sunkaddr135.prol = inttoptr i64 %sunkaddr134.prol to double*
  %63 = load double, double* %sunkaddr135.prol, align 8
  %64 = fmul double %62, %63
  %65 = fsub double %61, %64
  store double %65, double* %60, align 8
  br label %.prol.loopexit149

.prol.loopexit149:                                ; preds = %.prol.preheader148, %.lr.ph90.us
  %indvars.iv89.us.unr.ph = phi i64 [ 1, %.prol.preheader148 ], [ 0, %.lr.ph90.us ]
  br i1 false, label %.loopexit.us, label %.lr.ph90.us.new.preheader

.lr.ph90.us.new.preheader:                        ; preds = %.prol.loopexit149
  %sunkaddr174 = shl i64 %indvars.iv.next9395.us, 3
  %sunkaddr175 = add i64 %sunkaddr173, %sunkaddr174
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to double*
  br label %.lr.ph90.us.new

.lr.ph90.us.new:                                  ; preds = %.lr.ph90.us.new.preheader, %.lr.ph90.us.new
  %indvars.iv89.us = phi i64 [ %indvars.iv.next88.us.1, %.lr.ph90.us.new ], [ %indvars.iv89.us.unr.ph, %.lr.ph90.us.new.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv89.us, i64 %indvars.iv.next9395.us
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89.us, i64 %indvars.iv98100
  %69 = load double, double* %68, align 8
  %70 = load double, double* %sunkaddr176, align 8
  %71 = fmul double %69, %70
  %72 = fsub double %67, %71
  store double %72, double* %66, align 8
  %indvars.iv.next88.us = add nuw nsw i64 %indvars.iv89.us, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next88.us, i64 %indvars.iv.next9395.us
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next88.us, i64 %indvars.iv98100
  %76 = load double, double* %75, align 8
  %77 = load double, double* %sunkaddr176, align 8
  %78 = fmul double %76, %77
  %79 = fsub double %74, %78
  store double %79, double* %73, align 8
  %indvars.iv.next88.us.1 = add nuw nsw i64 %indvars.iv89.us, 2
  %exitcond125.1 = icmp eq i64 %indvars.iv.next88.us.1, 1000
  br i1 %exitcond125.1, label %.loopexit.us.loopexit, label %.lr.ph90.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph90.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit149
  %indvars.iv.next93.us = add nuw nsw i64 %indvars.iv.next9395.us, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next93.us, 1200
  br i1 %exitcond126, label %._crit_edge97.loopexit, label %.lr.ph96.split.us

.lr.ph83.new:                                     ; preds = %.lr.ph83.new.preheader, %.lr.ph83.new
  %indvars.iv81 = phi i64 [ %indvars.iv.next80.1, %.lr.ph83.new ], [ %indvars.iv81.unr.ph, %.lr.ph83.new.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv81, i64 %indvars.iv98100
  %81 = load double, double* %80, align 8
  %82 = load double, double* %sunkaddr184, align 8
  %83 = fdiv double %81, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv98100
  store double %83, double* %84, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv81, 1
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next80, i64 %indvars.iv98100
  %86 = load double, double* %85, align 8
  %87 = load double, double* %sunkaddr184, align 8
  %88 = fdiv double %86, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80, i64 %indvars.iv98100
  store double %88, double* %89, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv81, 2
  %exitcond122.1 = icmp eq i64 %indvars.iv.next80.1, 1000
  br i1 %exitcond122.1, label %.preheader76.loopexit, label %.lr.ph83.new

._crit_edge97.loopexit140:                        ; preds = %.lr.ph96
  %90 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %90, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge97

._crit_edge97.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97.loopexit, %._crit_edge97.loopexit140, %.preheader76
  %exitcond127 = icmp eq i64 %indvars.iv.next9394, 1200
  br i1 %exitcond127, label %._crit_edge102.loopexit, label %.preheader77

._crit_edge102.loopexit:                          ; preds = %._crit_edge97
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader25.lr.ph, label %._crit_edge39

.preheader25.lr.ph:                               ; preds = %4
  br label %.preheader25

.preheader25:                                     ; preds = %._crit_edge35, %.preheader25.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader25.lr.ph ], [ %indvars.iv.next36, %._crit_edge35 ]
  %9 = mul nsw i64 %indvars.iv37, 1200
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader25
  %indvars.iv33 = phi i64 [ 0, %.preheader25 ], [ %indvars.iv.next31, %17 ]
  %11 = add nsw i64 %indvars.iv33, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc42 = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv33
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond, label %._crit_edge35, label %10

._crit_edge35:                                    ; preds = %17
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond47, label %._crit_edge39.loopexit, label %.preheader25

._crit_edge39.loopexit:                           ; preds = %._crit_edge35
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br i1 true, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %._crit_edge39
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next27.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %26 = mul nsw i64 %indvars.iv28.us, 1200
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader.us
  %indvars.iv26.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %34 ]
  %28 = add nsw i64 %indvars.iv26.us, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %33) #6
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28.us, i64 %indvars.iv26.us
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond44, label %._crit_edge.us, label %27

._crit_edge.us:                                   ; preds = %34
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next27.us, 1000
  br i1 %exitcond45, label %._crit_edge30.loopexit, label %.preheader.us

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %._crit_edge39
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
