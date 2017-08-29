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

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader23.lr.ph, label %.preheader22

.preheader23.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader23.us.preheader, label %._crit_edge26

.preheader23.us.preheader:                        ; preds = %.preheader23.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %._crit_edge29.us, %.preheader23.us.preheader
  %indvars.iv41 = phi i64 [ 0, %.preheader23.us.preheader ], [ %indvars.iv.next42, %._crit_edge29.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader23.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %11 ], [ 0, %.preheader23.us ]
  %12 = mul nuw nsw i64 %indvars.iv37, %indvars.iv41
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv37
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv37
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %9
  br i1 %exitcond, label %._crit_edge29.us, label %11

._crit_edge29.us:                                 ; preds = %11
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next42, %10
  br i1 %exitcond51, label %.preheader22.loopexit, label %.preheader23.us

.preheader22.loopexit:                            ; preds = %._crit_edge29.us
  br label %.preheader22

.preheader22:                                     ; preds = %.preheader22.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge26

.preheader.us.preheader:                          ; preds = %.preheader22
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = zext i32 %1 to i64
  %25 = add nsw i64 %24, -1
  %xtraiter = and i64 %24, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv33.prol = phi i64 [ %indvars.iv.next34.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv33.prol, i64 0
  %scevgep48.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.prol = add nuw nsw i64 %indvars.iv33.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv33.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %._crit_edge26, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %27 = add nsw i64 %24, -4
  %28 = sub nsw i64 %27, %indvars.iv33.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod53 = icmp eq i64 %30, 0
  br i1 %lcmp.mod53, label %._crit_edge.us.3.prol, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.preheader
  %scevgep.prol55 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv33.unr, i64 0
  %scevgep48.prol56 = bitcast double* %scevgep.prol55 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.prol56, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.prol57 = add nuw nsw i64 %indvars.iv33.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.prol57, i64 0
  %scevgep48.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.1.prol = add nuw nsw i64 %indvars.iv33.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.1.prol, i64 0
  %scevgep48.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.2.prol = add nuw nsw i64 %indvars.iv33.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.2.prol, i64 0
  %scevgep48.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.3.prol = or i64 %indvars.iv33.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv33.unr58 = phi i64 [ %indvars.iv33.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next34.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge26, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us.3
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %._crit_edge.us.3.prol.loopexit, %.preheader23.lr.ph, %.preheader.us.prol.loopexit, %.preheader22
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv33 = phi i64 [ %indvars.iv33.unr58, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next34.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv33, i64 0
  %scevgep48 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34, i64 0
  %scevgep48.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.1, i64 0
  %scevgep48.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.2 = add nsw i64 %indvars.iv33, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.2, i64 0
  %scevgep48.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.3 = add nuw nsw i64 %indvars.iv33, 4
  %scevgep.159 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.3, i64 0
  %scevgep48.160 = bitcast double* %scevgep.159 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.160, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.161 = add nsw i64 %indvars.iv33, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.161, i64 0
  %scevgep48.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.1.1 = add nsw i64 %indvars.iv33, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.1.1, i64 0
  %scevgep48.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.2.1 = add nsw i64 %indvars.iv33, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next34.2.1, i64 0
  %scevgep48.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep48.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next34.3.1 = add nsw i64 %indvars.iv33, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next34.3.1, %24
  br i1 %exitcond.3.1, label %._crit_edge26.loopexit, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader58.lr.ph, label %._crit_edge74

.preheader58.lr.ph:                               ; preds = %5
  %7 = sext i32 %1 to i64
  %8 = zext i32 %0 to i64
  %9 = add nsw i64 %8, -1
  %10 = zext i32 %1 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add nsw i64 %11, -8
  %13 = zext i32 %1 to i64
  %xtraiter = and i64 %8, 3
  %xtraiter116 = and i64 %8, 1
  %xtraiter121 = and i64 %8, 1
  %xtraiter125 = and i64 %8, 1
  %14 = icmp sgt i32 %0, 0
  %15 = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %9, 3
  %17 = icmp sgt i32 %0, 0
  %18 = icmp eq i64 %xtraiter116, 0
  %19 = icmp eq i64 %9, 0
  %20 = icmp sgt i32 %0, 0
  %21 = icmp eq i64 %xtraiter121, 0
  %22 = icmp eq i64 %9, 0
  %23 = icmp sgt i32 %0, 0
  %24 = icmp eq i64 %xtraiter125, 0
  %25 = icmp eq i64 %9, 0
  %sunkaddr146 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr = ptrtoint [1200 x double]* %4 to i64
  br label %.preheader58

.preheader58:                                     ; preds = %._crit_edge72, %.preheader58.lr.ph
  %indvars.iv110 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next111, %._crit_edge72 ]
  %indvars.iv104 = phi i64 [ 1, %.preheader58.lr.ph ], [ %indvars.iv.next105, %._crit_edge72 ]
  %26 = mul i64 %indvars.iv110, 1201
  %27 = add i64 %26, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %27
  %28 = mul i64 %indvars.iv110, -8
  %29 = add i64 %12, %28
  br i1 %14, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader58
  br i1 %15, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.059.prol = phi double [ %33, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv110
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %.059.prol, %32
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %33, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.059.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %33, %.prol.loopexit.loopexit ]
  br i1 %16, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.059 = phi double [ %49, %.lr.ph.new ], [ %.059.unr, %.lr.ph.new.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv110
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %.059, %36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv110
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv110
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv110
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fadd double %45, %48
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond115.3 = icmp eq i64 %indvars.iv.next.3, %8
  br i1 %exitcond115.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader58
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader58 ], [ %.lcssa.unr, %.prol.loopexit ], [ %49, %._crit_edge.loopexit ]
  %50 = tail call double @sqrt(double %.0.lcssa) #4
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv110
  store double %50, double* %51, align 8
  br i1 %17, label %.lr.ph63.preheader, label %.preheader57

.lr.ph63.preheader:                               ; preds = %._crit_edge
  br i1 %18, label %.lr.ph63.prol.loopexit, label %.lr.ph63.prol

.lr.ph63.prol:                                    ; preds = %.lr.ph63.preheader
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %53 = load double, double* %52, align 8
  %54 = load double, double* %51, align 8
  %55 = fdiv double %53, %54
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv110
  store double %55, double* %56, align 8
  br label %.lr.ph63.prol.loopexit

.lr.ph63.prol.loopexit:                           ; preds = %.lr.ph63.prol, %.lr.ph63.preheader
  %indvars.iv86.unr.ph = phi i64 [ 1, %.lr.ph63.prol ], [ 0, %.lr.ph63.preheader ]
  br i1 %19, label %.preheader57, label %.lr.ph63.preheader140

.lr.ph63.preheader140:                            ; preds = %.lr.ph63.prol.loopexit
  br label %.lr.ph63

.preheader57.loopexit:                            ; preds = %.lr.ph63
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.lr.ph63.prol.loopexit, %._crit_edge
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %57 = icmp slt i64 %indvars.iv.next111, %7
  br i1 %57, label %.lr.ph71, label %._crit_edge72

.lr.ph71:                                         ; preds = %.preheader57
  br i1 %20, label %.lr.ph71.split.us.preheader, label %._crit_edge72.loopexit114

.lr.ph71.split.us.preheader:                      ; preds = %.lr.ph71
  %sunkaddr147 = mul nuw nsw i64 %indvars.iv110, 8
  %sunkaddr148 = add i64 %sunkaddr146, %sunkaddr147
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to double*
  %sunkaddr143 = mul nuw nsw i64 %indvars.iv110, 8
  %sunkaddr144 = add i64 %sunkaddr, %sunkaddr143
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  br label %.lr.ph71.split.us

.lr.ph71.split.us:                                ; preds = %.lr.ph71.split.us.preheader, %.loopexit.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %.loopexit.us ], [ %indvars.iv104, %.lr.ph71.split.us.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv106
  store double 0.000000e+00, double* %58, align 8
  br i1 %21, label %.prol.loopexit120, label %.prol.preheader119

.prol.preheader119:                               ; preds = %.lr.ph71.split.us
  %59 = load double, double* %sunkaddr145, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv106
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %62, 0.000000e+00
  store double %63, double* %58, align 8
  br label %.prol.loopexit120

.prol.loopexit120:                                ; preds = %.prol.preheader119, %.lr.ph71.split.us
  %indvars.iv96.unr.ph = phi i64 [ 1, %.prol.preheader119 ], [ 0, %.lr.ph71.split.us ]
  %.unr.ph = phi double [ %63, %.prol.preheader119 ], [ 0.000000e+00, %.lr.ph71.split.us ]
  br i1 %22, label %.preheader.us, label %.lr.ph71.split.us.new.preheader

.lr.ph71.split.us.new.preheader:                  ; preds = %.prol.loopexit120
  br label %.lr.ph71.split.us.new

.lr.ph71.split.us.new:                            ; preds = %.lr.ph71.split.us.new.preheader, %.lr.ph71.split.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.lr.ph71.split.us.new ], [ %indvars.iv96.unr.ph, %.lr.ph71.split.us.new.preheader ]
  %64 = phi double [ %76, %.lr.ph71.split.us.new ], [ %.unr.ph, %.lr.ph71.split.us.new.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv110
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv96, i64 %indvars.iv106
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %58, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next97, i64 %indvars.iv110
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next97, i64 %indvars.iv106
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %58, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond.1124 = icmp eq i64 %indvars.iv.next97.1, %8
  br i1 %exitcond.1124, label %.preheader.us.loopexit, label %.lr.ph71.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph71.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit120
  br i1 %23, label %.lr.ph68.us.preheader, label %.loopexit.us

.lr.ph68.us.preheader:                            ; preds = %.preheader.us
  br i1 %24, label %.lr.ph68.us.prol.loopexit, label %.lr.ph68.us.prol

.lr.ph68.us.prol:                                 ; preds = %.lr.ph68.us.preheader
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv106
  %78 = load double, double* %77, align 8
  %79 = load double, double* %sunkaddr149, align 8
  %80 = load double, double* %58, align 8
  %81 = fmul double %79, %80
  %82 = fsub double %78, %81
  store double %82, double* %77, align 8
  br label %.lr.ph68.us.prol.loopexit

.lr.ph68.us.prol.loopexit:                        ; preds = %.lr.ph68.us.prol, %.lr.ph68.us.preheader
  %indvars.iv100.unr.ph = phi i64 [ 1, %.lr.ph68.us.prol ], [ 0, %.lr.ph68.us.preheader ]
  br i1 %25, label %.loopexit.us, label %.lr.ph68.us.preheader139

.lr.ph68.us.preheader139:                         ; preds = %.lr.ph68.us.prol.loopexit
  br label %.lr.ph68.us

.lr.ph68.us:                                      ; preds = %.lr.ph68.us.preheader139, %.lr.ph68.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph68.us ], [ %indvars.iv100.unr.ph, %.lr.ph68.us.preheader139 ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv106
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv110
  %86 = load double, double* %85, align 8
  %87 = load double, double* %58, align 8
  %88 = fmul double %86, %87
  %89 = fsub double %84, %88
  store double %89, double* %83, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv106
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv110
  %93 = load double, double* %92, align 8
  %94 = load double, double* %58, align 8
  %95 = fmul double %93, %94
  %96 = fsub double %91, %95
  store double %96, double* %90, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond.1128 = icmp eq i64 %indvars.iv.next101.1, %8
  br i1 %exitcond.1128, label %.loopexit.us.loopexit, label %.lr.ph68.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph68.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph68.us.prol.loopexit, %.preheader.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond = icmp eq i64 %indvars.iv.next107, %13
  br i1 %exitcond, label %._crit_edge72.loopexit, label %.lr.ph71.split.us

.lr.ph63:                                         ; preds = %.lr.ph63.preheader140, %.lr.ph63
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %.lr.ph63 ], [ %indvars.iv86.unr.ph, %.lr.ph63.preheader140 ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv86, i64 %indvars.iv110
  %98 = load double, double* %97, align 8
  %99 = load double, double* %51, align 8
  %100 = fdiv double %98, %99
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv110
  store double %100, double* %101, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next87, i64 %indvars.iv110
  %103 = load double, double* %102, align 8
  %104 = load double, double* %51, align 8
  %105 = fdiv double %103, %104
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next87, i64 %indvars.iv110
  store double %105, double* %106, align 8
  %indvars.iv.next87.1 = add nuw nsw i64 %indvars.iv86, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next87.1, %8
  br i1 %exitcond.1, label %.preheader57.loopexit, label %.lr.ph63

._crit_edge72.loopexit114:                        ; preds = %.lr.ph71
  %107 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %107, i8 0, i64 %29, i32 8, i1 false)
  br label %._crit_edge72

._crit_edge72.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %._crit_edge72.loopexit114, %.preheader57
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next111, %10
  br i1 %exitcond131, label %._crit_edge74.loopexit, label %.preheader58

._crit_edge74.loopexit:                           ; preds = %._crit_edge72
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader25.us.preheader, label %._crit_edge35

.preheader25.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge32.us, %.preheader25.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next47, %._crit_edge32.us ]
  %13 = mul nsw i64 %indvars.iv46, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader25.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %21 ], [ 0, %.preheader25.us ]
  %15 = add nsw i64 %indvars.iv42, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next43, %11
  br i1 %exitcond52, label %._crit_edge32.us, label %14

._crit_edge32.us:                                 ; preds = %21
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next47, %12
  br i1 %exitcond53, label %._crit_edge35.loopexit, label %.preheader25.us

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %._crit_edge35
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next38, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv37, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %43 ], [ 0, %.preheader.us ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond51, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %34
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge35
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
