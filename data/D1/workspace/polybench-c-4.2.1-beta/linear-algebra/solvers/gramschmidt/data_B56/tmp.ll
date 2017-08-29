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
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader27.us
  %indvars.iv41 = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next42, %11 ]
  %12 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %9
  br i1 %exitcond, label %._crit_edge33.us, label %11

._crit_edge33.us:                                 ; preds = %11
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond54, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.preheader.._crit_edge.us.prol_crit_edge

.preheader.us.preheader.._crit_edge.us.prol_crit_edge: ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, %.preheader.us.preheader.._crit_edge.us.prol_crit_edge
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %.preheader.us.preheader.._crit_edge.us.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ %xtraiter, %.preheader.us.preheader.._crit_edge.us.prol_crit_edge ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep51.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol, i8 0, i64 %23, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !1

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  br label %._crit_edge.us.prol

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge30, label %.preheader.us.prol.loopexit.._crit_edge.us.3_crit_edge

.preheader.us.prol.loopexit.._crit_edge.us.3_crit_edge: ; preds = %.preheader.us.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us.3
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader.us.prol.loopexit, %.preheader26, %.preheader27.lr.ph
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %.preheader.us.prol.loopexit.._crit_edge.us.3_crit_edge
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr, %.preheader.us.prol.loopexit.._crit_edge.us.3_crit_edge ], [ %indvars.iv.next38.3, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep51 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep51.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep51.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep51.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next38.3, %22
  br i1 %exitcond.3, label %._crit_edge30.loopexit, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader66.lr.ph, label %._crit_edge82

.preheader66.lr.ph:                               ; preds = %5
  %7 = sext i32 %1 to i64
  %8 = zext i32 %0 to i64
  %9 = add nsw i64 %8, -1
  %10 = zext i32 %1 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add nsw i64 %11, -8
  %xtraiter = and i64 %8, 3
  %xtraiter125 = and i64 %8, 1
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge80..preheader66_crit_edge, %.preheader66.lr.ph
  %indvars.iv118 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next119, %._crit_edge80..preheader66_crit_edge ]
  %indvars.iv112 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next113, %._crit_edge80..preheader66_crit_edge ]
  %13 = icmp sgt i32 %0, 0
  %14 = mul i64 %indvars.iv118, 1201
  %15 = add i64 %14, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %15
  %16 = mul i64 %indvars.iv118, -8
  %17 = add i64 %12, %16
  br i1 %13, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader66
  %18 = icmp eq i64 %xtraiter, 0
  br i1 %18, label %.prol.loopexit, label %.lr.ph..prol.preheader_crit_edge

.lr.ph..prol.preheader_crit_edge:                 ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.lr.ph..prol.preheader_crit_edge ]
  %.068.prol = phi double [ %22, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.lr.ph..prol.preheader_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph..prol.preheader_crit_edge ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv118
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fadd double %.068.prol, %21
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %22, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.068.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %22, %.prol.loopexit.loopexit ]
  %23 = icmp ult i64 %9, 3
  br i1 %23, label %._crit_edge, label %.prol.loopexit..lr.ph.new_crit_edge

.prol.loopexit..lr.ph.new_crit_edge:              ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.prol.loopexit..lr.ph.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.prol.loopexit..lr.ph.new_crit_edge ], [ %indvars.iv.next.3, %.lr.ph.new ]
  %.068 = phi double [ %.068.unr, %.prol.loopexit..lr.ph.new_crit_edge ], [ %39, %.lr.ph.new ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv118
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %25
  %27 = fadd double %.068, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv118
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %29
  %31 = fadd double %27, %30
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv118
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv118
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond122.3 = icmp eq i64 %indvars.iv.next.3, %8
  br i1 %exitcond122.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader66
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader66 ], [ %.lcssa.unr, %.prol.loopexit ], [ %39, %._crit_edge.loopexit ]
  %40 = icmp sgt i32 %0, 0
  %41 = tail call double @sqrt(double %.0.lcssa) #4
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv118
  store double %41, double* %42, align 8
  br i1 %40, label %.lr.ph71, label %.preheader65

.lr.ph71:                                         ; preds = %._crit_edge
  %43 = icmp eq i64 %xtraiter125, 0
  br i1 %43, label %.prol.loopexit124, label %.prol.preheader123

.prol.preheader123:                               ; preds = %.lr.ph71
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv118
  %45 = load double, double* %44, align 8
  %46 = fdiv double %45, %41
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv118
  store double %46, double* %47, align 8
  br label %.prol.loopexit124

.prol.loopexit124:                                ; preds = %.lr.ph71, %.prol.preheader123
  %indvars.iv94.unr.ph = phi i64 [ 1, %.prol.preheader123 ], [ 0, %.lr.ph71 ]
  %48 = icmp eq i64 %9, 0
  br i1 %48, label %.preheader65, label %.prol.loopexit124..lr.ph71.new_crit_edge

.prol.loopexit124..lr.ph71.new_crit_edge:         ; preds = %.prol.loopexit124
  br label %.lr.ph71.new

.preheader65.loopexit:                            ; preds = %.lr.ph71.new
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.loopexit, %.prol.loopexit124, %._crit_edge
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %49 = icmp slt i64 %indvars.iv.next119, %7
  br i1 %49, label %.lr.ph79, label %._crit_edge80

.lr.ph79:                                         ; preds = %.preheader65
  %50 = icmp sgt i32 %0, 0
  br i1 %50, label %.lr.ph79.split.us.preheader, label %._crit_edge80.loopexit93

.lr.ph79.split.us.preheader:                      ; preds = %.lr.ph79
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %.loopexit.us, %.lr.ph79.split.us.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv112, %.lr.ph79.split.us.preheader ], [ %indvars.iv.next115, %.loopexit.us ]
  %51 = icmp eq i64 %xtraiter125, 0
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv118, i64 %indvars.iv114
  store double 0.000000e+00, double* %52, align 8
  br i1 %51, label %.prol.loopexit129, label %.prol.preheader128

.prol.preheader128:                               ; preds = %.lr.ph79.split.us
  %sunkaddr = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr151 = mul i64 %indvars.iv118, 8
  %sunkaddr152 = add i64 %sunkaddr, %sunkaddr151
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to double*
  %53 = load double, double* %sunkaddr153, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %56, 0.000000e+00
  store double %57, double* %52, align 8
  br label %.prol.loopexit129

.prol.loopexit129:                                ; preds = %.lr.ph79.split.us, %.prol.preheader128
  %58 = phi double [ %57, %.prol.preheader128 ], [ 0.000000e+00, %.lr.ph79.split.us ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.prol.preheader128 ], [ 0, %.lr.ph79.split.us ]
  %59 = icmp eq i64 %9, 0
  br i1 %59, label %.lr.ph76.us, label %.prol.loopexit129..lr.ph79.split.us.new_crit_edge

.prol.loopexit129..lr.ph79.split.us.new_crit_edge: ; preds = %.prol.loopexit129
  br label %.lr.ph79.split.us.new

.lr.ph79.split.us.new:                            ; preds = %.lr.ph79.split.us.new, %.prol.loopexit129..lr.ph79.split.us.new_crit_edge
  %60 = phi double [ %58, %.prol.loopexit129..lr.ph79.split.us.new_crit_edge ], [ %72, %.lr.ph79.split.us.new ]
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.prol.loopexit129..lr.ph79.split.us.new_crit_edge ], [ %indvars.iv.next105.1, %.lr.ph79.split.us.new ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv118
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv114
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %52, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv118
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv114
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %52, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond.1133 = icmp eq i64 %indvars.iv.next105.1, %8
  br i1 %exitcond.1133, label %.lr.ph76.us.loopexit, label %.lr.ph79.split.us.new

.lr.ph76.us.loopexit:                             ; preds = %.lr.ph79.split.us.new
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.loopexit, %.prol.loopexit129
  %73 = phi double [ %58, %.prol.loopexit129 ], [ %72, %.lr.ph76.us.loopexit ]
  %74 = icmp eq i64 %xtraiter125, 0
  br i1 %74, label %.prol.loopexit135, label %.prol.preheader134

.prol.preheader134:                               ; preds = %.lr.ph76.us
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %76 = load double, double* %75, align 8
  %sunkaddr154 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr155 = mul i64 %indvars.iv118, 8
  %sunkaddr156 = add i64 %sunkaddr154, %sunkaddr155
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to double*
  %77 = load double, double* %sunkaddr157, align 8
  %78 = fmul double %77, %73
  %79 = fsub double %76, %78
  store double %79, double* %75, align 8
  br label %.prol.loopexit135

.prol.loopexit135:                                ; preds = %.lr.ph76.us, %.prol.preheader134
  %indvars.iv108.unr.ph = phi i64 [ 1, %.prol.preheader134 ], [ 0, %.lr.ph76.us ]
  %80 = icmp eq i64 %9, 0
  br i1 %80, label %.loopexit.us, label %.prol.loopexit135..lr.ph76.us.new_crit_edge

.prol.loopexit135..lr.ph76.us.new_crit_edge:      ; preds = %.prol.loopexit135
  br label %.lr.ph76.us.new

.lr.ph76.us.new:                                  ; preds = %.lr.ph76.us.new, %.prol.loopexit135..lr.ph76.us.new_crit_edge
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %.prol.loopexit135..lr.ph76.us.new_crit_edge ], [ %indvars.iv.next109.1, %.lr.ph76.us.new ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv108, i64 %indvars.iv114
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv108, i64 %indvars.iv118
  %84 = load double, double* %83, align 8
  %85 = load double, double* %52, align 8
  %86 = fmul double %84, %85
  %87 = fsub double %82, %86
  store double %87, double* %81, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next109, i64 %indvars.iv114
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next109, i64 %indvars.iv118
  %91 = load double, double* %90, align 8
  %92 = load double, double* %52, align 8
  %93 = fmul double %91, %92
  %94 = fsub double %89, %93
  store double %94, double* %88, align 8
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond.1139 = icmp eq i64 %indvars.iv.next109.1, %8
  br i1 %exitcond.1139, label %.loopexit.us.loopexit, label %.lr.ph76.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph76.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit135
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond = icmp eq i64 %indvars.iv.next115, %10
  br i1 %exitcond, label %._crit_edge80.loopexit, label %.lr.ph79.split.us

.lr.ph71.new:                                     ; preds = %.lr.ph71.new, %.prol.loopexit124..lr.ph71.new_crit_edge
  %indvars.iv94 = phi i64 [ %indvars.iv94.unr.ph, %.prol.loopexit124..lr.ph71.new_crit_edge ], [ %indvars.iv.next95.1, %.lr.ph71.new ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv94, i64 %indvars.iv118
  %96 = load double, double* %95, align 8
  %97 = load double, double* %42, align 8
  %98 = fdiv double %96, %97
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv94, i64 %indvars.iv118
  store double %98, double* %99, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next95, i64 %indvars.iv118
  %101 = load double, double* %100, align 8
  %102 = load double, double* %42, align 8
  %103 = fdiv double %101, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next95, i64 %indvars.iv118
  store double %103, double* %104, align 8
  %indvars.iv.next95.1 = add nuw nsw i64 %indvars.iv94, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next95.1, %8
  br i1 %exitcond.1, label %.preheader65.loopexit, label %.lr.ph71.new

._crit_edge80.loopexit93:                         ; preds = %.lr.ph79
  %105 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %105, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge80

._crit_edge80.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %.preheader65, %._crit_edge80.loopexit93
  %exitcond142 = icmp eq i64 %indvars.iv.next119, %10
  br i1 %exitcond142, label %._crit_edge82.loopexit, label %._crit_edge80..preheader66_crit_edge

._crit_edge80..preheader66_crit_edge:             ; preds = %._crit_edge80
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br label %.preheader66

._crit_edge82.loopexit:                           ; preds = %._crit_edge80
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader28.us.preheader, label %._crit_edge38

.preheader28.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next50, %._crit_edge35.us ]
  %12 = mul nsw i64 %indvars.iv49, %10
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader28.us
  %indvars.iv45 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next46, %20 ]
  %14 = add nsw i64 %indvars.iv45, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %13, %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %11
  br i1 %exitcond54, label %._crit_edge35.us, label %13

._crit_edge35.us:                                 ; preds = %20
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, %11
  br i1 %exitcond55, label %._crit_edge38.loopexit, label %.preheader28.us

._crit_edge38.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %4
  %25 = icmp sgt i32 %1, 0
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %30 = icmp sgt i32 %0, 0
  %or.cond = and i1 %30, %25
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge32

.preheader.us.preheader:                          ; preds = %._crit_edge38
  %31 = sext i32 %1 to i64
  %32 = zext i32 %1 to i64
  %33 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %34 = mul nsw i64 %indvars.iv40, %31
  br label %35

; <label>:35:                                     ; preds = %42, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %42 ]
  %36 = add nsw i64 %indvars.iv, %34
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 20
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %35
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %41) #6
  br label %42

; <label>:42:                                     ; preds = %35, %40
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %45) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, %32
  br i1 %exitcond53, label %._crit_edge.us, label %35

._crit_edge.us:                                   ; preds = %42
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %33
  br i1 %exitcond, label %._crit_edge32.loopexit, label %.preheader.us

._crit_edge32.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %._crit_edge38
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %49) #6
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
