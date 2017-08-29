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
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %11 ], [ 0, %.preheader27.us ]
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
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us.prol ], [ %xtraiter, %.preheader.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep51.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge30, label %.preheader.us.preheader57

.preheader.us.preheader57:                        ; preds = %.preheader.us.prol.loopexit
  %26 = add nsw i64 %22, -4
  %27 = sub nsw i64 %26, %indvars.iv37.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod61 = icmp eq i64 %29, 0
  br i1 %lcmp.mod61, label %.preheader.us.prol.preheader58, label %.preheader.us.prol.loopexit59

.preheader.us.prol.preheader58:                   ; preds = %.preheader.us.preheader57
  br label %.preheader.us.prol62

.preheader.us.prol62:                             ; preds = %.preheader.us.prol.preheader58
  %scevgep.prol64 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.unr, i64 0
  %scevgep51.prol65 = bitcast double* %scevgep.prol64 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.prol65, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol66 = add nuw nsw i64 %indvars.iv37.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.prol66, i64 0
  %scevgep51.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.prol = add nuw nsw i64 %indvars.iv37.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.prol, i64 0
  %scevgep51.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.prol = add nuw nsw i64 %indvars.iv37.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.prol, i64 0
  %scevgep51.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.prol = or i64 %indvars.iv37.unr, 4
  br label %.preheader.us.prol.loopexit59

.preheader.us.prol.loopexit59:                    ; preds = %.preheader.us.prol62, %.preheader.us.preheader57
  %indvars.iv37.unr67 = phi i64 [ %indvars.iv37.unr, %.preheader.us.preheader57 ], [ %indvars.iv.next38.3.prol, %.preheader.us.prol62 ]
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge30.loopexit, label %.preheader.us.preheader57.new

.preheader.us.preheader57.new:                    ; preds = %.preheader.us.prol.loopexit59
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader57.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr67, %.preheader.us.preheader57.new ], [ %indvars.iv.next38.3.1, %.preheader.us ]
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
  %scevgep.168 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep51.169 = bitcast double* %scevgep.168 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.169, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.170 = add nsw i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.170, i64 0
  %scevgep51.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.1 = add nsw i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep51.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.1 = add nsw i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep51.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep51.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, %22
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %.preheader.us

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %.preheader.us
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %.preheader.us.prol.loopexit59, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader27.lr.ph, %.preheader.us.prol.loopexit, %.preheader26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader76.lr.ph, label %._crit_edge93

.preheader76.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = sext i32 %1 to i64
  %9 = zext i32 %0 to i64
  %10 = add nsw i64 %9, -1
  %11 = zext i32 %1 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nsw i64 %12, -8
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %10, 3
  %xtraiter140 = and i64 %9, 1
  %lcmp.mod141 = icmp eq i64 %xtraiter140, 0
  %15 = icmp eq i64 %10, 0
  %xtraiter145 = and i64 %9, 1
  %lcmp.mod146 = icmp ne i64 %xtraiter145, 0
  %16 = icmp eq i64 %10, 0
  br label %.preheader76

.loopexit.loopexit:                               ; preds = %._crit_edge88.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph91.split.split.preheader, %._crit_edge82
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next134, %11
  br i1 %exitcond157, label %._crit_edge93.loopexit, label %.preheader76

.preheader76:                                     ; preds = %.loopexit, %.preheader76.lr.ph
  %indvars.iv133 = phi i64 [ 0, %.preheader76.lr.ph ], [ %indvars.iv.next134, %.loopexit ]
  %indvars.iv127 = phi i64 [ 1, %.preheader76.lr.ph ], [ %indvars.iv.next128, %.loopexit ]
  %17 = mul i64 %indvars.iv133, 1201
  %18 = add i64 %17, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %18
  %scevgep142 = bitcast double* %scevgep to i8*
  %19 = mul i64 %indvars.iv133, -8
  %20 = add i64 %13, %19
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader76
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.078.prol = phi double [ %24, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv133
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %22
  %24 = fadd double %.078.prol, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %24, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.078.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %24, %.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.078 = phi double [ %40, %.lr.ph.new ], [ %.078.unr, %.lr.ph.new.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv133
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %26
  %28 = fadd double %.078, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv133
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %30
  %32 = fadd double %28, %31
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv133
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %34
  %36 = fadd double %32, %35
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv133
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fadd double %36, %39
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond137.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond137.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader76
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader76 ], [ %.lcssa.unr, %.prol.loopexit ], [ %40, %._crit_edge.loopexit ]
  %41 = tail call double @sqrt(double %.0.lcssa) #4
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv133
  store double %41, double* %43, align 8
  br i1 %7, label %.lr.ph81, label %._crit_edge82

.lr.ph81:                                         ; preds = %._crit_edge
  %sunkaddr = ptrtoint [1200 x double]* %42 to i64
  %sunkaddr65 = shl nsw i64 %indvars.iv133, 3
  %sunkaddr66 = add i64 %sunkaddr, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  br i1 %lcmp.mod141, label %.prol.loopexit139.unr-lcssa, label %.prol.preheader138

.prol.preheader138:                               ; preds = %.lr.ph81
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv133
  %45 = load double, double* %44, align 8
  %46 = load double, double* %sunkaddr67, align 8
  %47 = fdiv double %45, %46
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv133
  store double %47, double* %48, align 8
  br label %.prol.loopexit139.unr-lcssa

.prol.loopexit139.unr-lcssa:                      ; preds = %.lr.ph81, %.prol.preheader138
  %indvars.iv109.unr.ph = phi i64 [ 1, %.prol.preheader138 ], [ 0, %.lr.ph81 ]
  br i1 %15, label %._crit_edge82, label %.lr.ph81.new.preheader

.lr.ph81.new.preheader:                           ; preds = %.prol.loopexit139.unr-lcssa
  br label %.lr.ph81.new

.lr.ph81.new:                                     ; preds = %.lr.ph81.new.preheader, %.lr.ph81.new
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.1, %.lr.ph81.new ], [ %indvars.iv109.unr.ph, %.lr.ph81.new.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv109, i64 %indvars.iv133
  %50 = load double, double* %49, align 8
  %51 = load double, double* %sunkaddr67, align 8
  %52 = fdiv double %50, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv133
  store double %52, double* %53, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next110, i64 %indvars.iv133
  %55 = load double, double* %54, align 8
  %56 = load double, double* %sunkaddr67, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next110, i64 %indvars.iv133
  store double %57, double* %58, align 8
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next110.1, %9
  br i1 %exitcond.1, label %._crit_edge82.loopexit, label %.lr.ph81.new

._crit_edge82.loopexit:                           ; preds = %.lr.ph81.new
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %.prol.loopexit139.unr-lcssa, %._crit_edge
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %59 = icmp slt i64 %indvars.iv.next134, %8
  br i1 %59, label %.lr.ph91, label %.loopexit

.lr.ph91:                                         ; preds = %._crit_edge82
  %sunkaddr68 = ptrtoint [1200 x double]* %42 to i64
  br i1 %7, label %.lr.ph91.split.us.preheader, label %.lr.ph91.split.split.preheader

.lr.ph91.split.us.preheader:                      ; preds = %.lr.ph91
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv133
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv133
  br label %.lr.ph91.split.us

.lr.ph91.split.split.preheader:                   ; preds = %.lr.ph91
  call void @llvm.memset.p0i8.i64(i8* %scevgep142, i8 0, i64 %20, i32 8, i1 false)
  br label %.loopexit

.lr.ph91.split.us:                                ; preds = %.lr.ph91.split.us.preheader, %._crit_edge88.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge88.us ], [ %indvars.iv127, %.lr.ph91.split.us.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv133, i64 %indvars.iv129
  store double 0.000000e+00, double* %62, align 8
  %sunkaddr69.us = shl nsw i64 %indvars.iv129, 3
  %sunkaddr70.us = add i64 %sunkaddr68, %sunkaddr69.us
  %sunkaddr71.us = inttoptr i64 %sunkaddr70.us to double*
  br i1 %lcmp.mod146, label %.prol.preheader143, label %.prol.loopexit144.unr-lcssa

.prol.preheader143:                               ; preds = %.lr.ph91.split.us
  %63 = load double, double* %60, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv129
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %66, 0.000000e+00
  store double %67, double* %sunkaddr71.us, align 8
  br label %.prol.loopexit144.unr-lcssa

.prol.loopexit144.unr-lcssa:                      ; preds = %.lr.ph91.split.us, %.prol.preheader143
  %indvars.iv119.unr.ph = phi i64 [ 1, %.prol.preheader143 ], [ 0, %.lr.ph91.split.us ]
  %.unr.ph = phi double [ %67, %.prol.preheader143 ], [ 0.000000e+00, %.lr.ph91.split.us ]
  br i1 %16, label %.lr.ph87.us, label %.lr.ph91.split.us.new.preheader

.lr.ph91.split.us.new.preheader:                  ; preds = %.prol.loopexit144.unr-lcssa
  br label %.lr.ph91.split.us.new

.lr.ph91.split.us.new:                            ; preds = %.lr.ph91.split.us.new.preheader, %.lr.ph91.split.us.new
  %indvars.iv119 = phi i64 [ %indvars.iv.next120.1, %.lr.ph91.split.us.new ], [ %indvars.iv119.unr.ph, %.lr.ph91.split.us.new.preheader ]
  %68 = phi double [ %80, %.lr.ph91.split.us.new ], [ %.unr.ph, %.lr.ph91.split.us.new.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv119, i64 %indvars.iv133
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv119, i64 %indvars.iv129
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %sunkaddr71.us, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next120, i64 %indvars.iv133
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next120, i64 %indvars.iv129
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %74, %79
  store double %80, double* %sunkaddr71.us, align 8
  %indvars.iv.next120.1 = add nuw nsw i64 %indvars.iv119, 2
  %exitcond.1148 = icmp eq i64 %indvars.iv.next120.1, %9
  br i1 %exitcond.1148, label %.lr.ph87.us.loopexit, label %.lr.ph91.split.us.new

.lr.ph87.us.loopexit:                             ; preds = %.lr.ph91.split.us.new
  br label %.lr.ph87.us

.lr.ph87.us:                                      ; preds = %.lr.ph87.us.loopexit, %.prol.loopexit144.unr-lcssa
  br i1 %lcmp.mod146, label %.prol.preheader149, label %.prol.loopexit150.unr-lcssa

.prol.preheader149:                               ; preds = %.lr.ph87.us
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv129
  %82 = load double, double* %81, align 8
  %83 = load double, double* %61, align 8
  %84 = load double, double* %sunkaddr71.us, align 8
  %85 = fmul double %83, %84
  %86 = fsub double %82, %85
  store double %86, double* %81, align 8
  br label %.prol.loopexit150.unr-lcssa

.prol.loopexit150.unr-lcssa:                      ; preds = %.lr.ph87.us, %.prol.preheader149
  %indvars.iv123.unr.ph = phi i64 [ 1, %.prol.preheader149 ], [ 0, %.lr.ph87.us ]
  br i1 %16, label %._crit_edge88.us, label %.lr.ph87.us.new.preheader

.lr.ph87.us.new.preheader:                        ; preds = %.prol.loopexit150.unr-lcssa
  br label %.lr.ph87.us.new

.lr.ph87.us.new:                                  ; preds = %.lr.ph87.us.new.preheader, %.lr.ph87.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv.next124.1, %.lr.ph87.us.new ], [ %indvars.iv123.unr.ph, %.lr.ph87.us.new.preheader ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv123, i64 %indvars.iv129
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv123, i64 %indvars.iv133
  %90 = load double, double* %89, align 8
  %91 = load double, double* %sunkaddr71.us, align 8
  %92 = fmul double %90, %91
  %93 = fsub double %88, %92
  store double %93, double* %87, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next124, i64 %indvars.iv129
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next124, i64 %indvars.iv133
  %97 = load double, double* %96, align 8
  %98 = load double, double* %sunkaddr71.us, align 8
  %99 = fmul double %97, %98
  %100 = fsub double %95, %99
  store double %100, double* %94, align 8
  %indvars.iv.next124.1 = add nuw nsw i64 %indvars.iv123, 2
  %exitcond.1154 = icmp eq i64 %indvars.iv.next124.1, %9
  br i1 %exitcond.1154, label %._crit_edge88.us.loopexit, label %.lr.ph87.us.new

._crit_edge88.us.loopexit:                        ; preds = %.lr.ph87.us.new
  br label %._crit_edge88.us

._crit_edge88.us:                                 ; preds = %._crit_edge88.us.loopexit, %.prol.loopexit150.unr-lcssa
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond = icmp eq i64 %indvars.iv.next130, %11
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph91.split.us

._crit_edge93.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %5
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
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader25.us.preheader, label %._crit_edge35

.preheader25.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge32.us, %.preheader25.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next50, %._crit_edge32.us ]
  %12 = mul nsw i64 %indvars.iv49, %10
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader25.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %20 ], [ 0, %.preheader25.us ]
  %14 = add nsw i64 %indvars.iv45, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc38.us = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %11
  br i1 %exitcond54, label %._crit_edge32.us, label %13

._crit_edge32.us:                                 ; preds = %20
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, %11
  br i1 %exitcond55, label %._crit_edge35.loopexit, label %.preheader25.us

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %.not = icmp slt i32 %0, 1
  %.not56 = xor i1 %9, true
  %brmerge = or i1 %.not, %.not56
  br i1 %brmerge, label %._crit_edge29, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge35
  %29 = sext i32 %1 to i64
  %30 = zext i32 %1 to i64
  %31 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %32 = mul nsw i64 %indvars.iv40, %29
  br label %33

; <label>:33:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %40 ], [ 0, %.preheader.us ]
  %34 = add nsw i64 %indvars.iv, %32
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 20
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %33
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %39) #6
  br label %40

; <label>:40:                                     ; preds = %38, %33
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %43) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, %30
  br i1 %exitcond53, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %31
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge35
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %47) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
