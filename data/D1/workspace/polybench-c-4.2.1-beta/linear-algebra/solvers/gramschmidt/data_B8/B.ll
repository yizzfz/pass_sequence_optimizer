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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader22.lr.ph, label %.preheader21

.preheader22.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader22.us.preheader, label %._crit_edge25

.preheader22.us.preheader:                        ; preds = %.preheader22.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge28.us, %.preheader22.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader22.us.preheader ], [ %indvars.iv.next41, %._crit_edge28.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader22.us
  %indvars.iv36 = phi i64 [ 0, %.preheader22.us ], [ %indvars.iv.next37, %._crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv36, %indvars.iv40
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %8
  %16 = fmul double %15, 1.000000e+02
  %17 = fadd double %16, 1.000000e+01
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %9
  br i1 %exitcond, label %._crit_edge28.us, label %._crit_edge

._crit_edge28.us:                                 ; preds = %._crit_edge
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next41, %10
  br i1 %exitcond49, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge28.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %5
  %20 = icmp sgt i32 %1, 0
  br i1 %20, label %.preheader.us.preheader, label %._crit_edge25

.preheader.us.preheader:                          ; preds = %.preheader21
  %21 = zext i32 %1 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = zext i32 %1 to i64
  %24 = add nsw i64 %23, -1
  %xtraiter = and i64 %23, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv32.prol = phi i64 [ %indvars.iv.next33.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv32.prol, i64 0
  %scevgep46.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv32.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next33.prol, %.preheader.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge25, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %26 = add nsw i64 %23, -4
  %27 = sub i64 %26, %indvars.iv32.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod51 = icmp eq i64 %29, 0
  br i1 %lcmp.mod51, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol53 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv32.unr, i64 0
  %scevgep46.prol54 = bitcast double* %scevgep.prol53 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.prol54, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.prol55 = add nuw nsw i64 %indvars.iv32.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.prol55, i64 0
  %scevgep46.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.1.prol = add nsw i64 %indvars.iv32.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.1.prol, i64 0
  %scevgep46.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.2.prol = add nsw i64 %indvars.iv32.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.2.prol, i64 0
  %scevgep46.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.3.prol = add nsw i64 %indvars.iv32.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv32.unr56 = phi i64 [ %indvars.iv32.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next33.3.prol, %._crit_edge.us.3.prol ]
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge25.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge25.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge25.loopexit.unr-lcssa
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.preheader.us.prol.loopexit, %.preheader21, %.preheader22.lr.ph
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr56, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next33.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv32, i64 0
  %scevgep46 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33, i64 0
  %scevgep46.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.1, i64 0
  %scevgep46.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.2, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.2 = add nsw i64 %indvars.iv32, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.2, i64 0
  %scevgep46.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.3 = add nsw i64 %indvars.iv32, 4
  %scevgep.157 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.3, i64 0
  %scevgep46.158 = bitcast double* %scevgep.157 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.158, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.159 = add nsw i64 %indvars.iv32, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.159, i64 0
  %scevgep46.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.1.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.1.1 = add nsw i64 %indvars.iv32, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.1.1, i64 0
  %scevgep46.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.2.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.2.1 = add nsw i64 %indvars.iv32, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next33.2.1, i64 0
  %scevgep46.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep46.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next33.3.1 = add nsw i64 %indvars.iv32, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next33.3.1, %23
  br i1 %exitcond.3.1, label %._crit_edge25.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader58.lr.ph, label %._crit_edge74

.preheader58.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = add nsw i64 %12, -1
  %14 = zext i32 %1 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nsw i64 %15, -8
  %17 = zext i32 %1 to i64
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %13, 3
  %xtraiter115 = and i64 %12, 1
  %lcmp.mod116 = icmp eq i64 %xtraiter115, 0
  %19 = icmp eq i64 %13, 0
  %xtraiter120 = and i64 %12, 1
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  %20 = icmp eq i64 %13, 0
  %xtraiter124 = and i64 %12, 1
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  %21 = icmp eq i64 %13, 0
  br label %.preheader58

.preheader58:                                     ; preds = %._crit_edge72..preheader58_crit_edge, %.preheader58.lr.ph
  %indvars.iv110 = phi i64 [ 0, %.preheader58.lr.ph ], [ %indvars.iv.next111, %._crit_edge72..preheader58_crit_edge ]
  %indvars.iv104 = phi i64 [ 1, %.preheader58.lr.ph ], [ %indvars.iv.next105, %._crit_edge72..preheader58_crit_edge ]
  %22 = mul i64 %indvars.iv110, 1201
  %23 = add i64 %22, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %23
  %scevgep117 = bitcast double* %scevgep to i8*
  %24 = mul i64 %indvars.iv110, -8
  %25 = add i64 %16, %24
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader58
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.059.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv110
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.059.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.059.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.059 = phi double [ %45, %.lr.ph.new ], [ %.059.unr, %.lr.ph.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv110
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %.059, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv110
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv110
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv110
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond114.3 = icmp eq i64 %indvars.iv.next.3, %12
  br i1 %exitcond114.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader58
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader58 ], [ %.lcssa.unr, %.prol.loopexit ], [ %45, %._crit_edge.loopexit ]
  %46 = tail call double @sqrt(double %.0.lcssa) #4
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv110
  store double %46, double* %47, align 8
  br i1 %8, label %.lr.ph63.preheader, label %.preheader57

.lr.ph63.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod116, label %.lr.ph63.prol.loopexit, label %.lr.ph63.prol

.lr.ph63.prol:                                    ; preds = %.lr.ph63.preheader
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fdiv double %49, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv110
  store double %51, double* %52, align 8
  br label %.lr.ph63.prol.loopexit

.lr.ph63.prol.loopexit:                           ; preds = %.lr.ph63.preheader, %.lr.ph63.prol
  %indvars.iv86.unr.ph = phi i64 [ 1, %.lr.ph63.prol ], [ 0, %.lr.ph63.preheader ]
  br i1 %19, label %.preheader57, label %.lr.ph63.preheader138

.lr.ph63.preheader138:                            ; preds = %.lr.ph63.prol.loopexit
  br label %.lr.ph63

.preheader57.loopexit:                            ; preds = %.lr.ph63
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.lr.ph63.prol.loopexit, %._crit_edge
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %53 = icmp slt i64 %indvars.iv.next111, %11
  br i1 %53, label %.lr.ph71, label %._crit_edge72

.lr.ph71:                                         ; preds = %.preheader57
  br i1 %9, label %.lr.ph71.split.us.preheader, label %._crit_edge72.loopexit85

.lr.ph71.split.us.preheader:                      ; preds = %.lr.ph71
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv110
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv110
  br label %.lr.ph71.split.us

.lr.ph71.split.us:                                ; preds = %.loopexit.us, %.lr.ph71.split.us.preheader
  %indvars.iv106 = phi i64 [ %indvars.iv104, %.lr.ph71.split.us.preheader ], [ %indvars.iv.next107, %.loopexit.us ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv106
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod121, label %.prol.loopexit119, label %.prol.preheader118

.prol.preheader118:                               ; preds = %.lr.ph71.split.us
  %57 = load double, double* %55, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv106
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, 0.000000e+00
  store double %61, double* %56, align 8
  br label %.prol.loopexit119

.prol.loopexit119:                                ; preds = %.lr.ph71.split.us, %.prol.preheader118
  %indvars.iv96.unr.ph = phi i64 [ 1, %.prol.preheader118 ], [ 0, %.lr.ph71.split.us ]
  %.unr.ph = phi double [ %61, %.prol.preheader118 ], [ 0.000000e+00, %.lr.ph71.split.us ]
  br i1 %20, label %..preheader_crit_edge.us, label %.lr.ph71.split.us.new.preheader

.lr.ph71.split.us.new.preheader:                  ; preds = %.prol.loopexit119
  br label %.lr.ph71.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph68.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph68.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond = icmp eq i64 %indvars.iv.next107, %17
  br i1 %exitcond, label %._crit_edge72.loopexit, label %.lr.ph71.split.us

.lr.ph68.us:                                      ; preds = %.lr.ph68.us.preheader137, %.lr.ph68.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph68.us ], [ %indvars.iv100.unr.ph, %.lr.ph68.us.preheader137 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv106
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv110
  %65 = load double, double* %64, align 8
  %66 = load double, double* %56, align 8
  %67 = fmul double %65, %66
  %68 = fsub double %63, %67
  store double %68, double* %62, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv106
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv110
  %72 = load double, double* %71, align 8
  %73 = load double, double* %56, align 8
  %74 = fmul double %72, %73
  %75 = fsub double %70, %74
  store double %75, double* %69, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond.1127 = icmp eq i64 %indvars.iv.next101.1, %12
  br i1 %exitcond.1127, label %.loopexit.us.loopexit, label %.lr.ph68.us

.lr.ph71.split.us.new:                            ; preds = %.lr.ph71.split.us.new.preheader, %.lr.ph71.split.us.new
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.lr.ph71.split.us.new ], [ %indvars.iv96.unr.ph, %.lr.ph71.split.us.new.preheader ]
  %76 = phi double [ %88, %.lr.ph71.split.us.new ], [ %.unr.ph, %.lr.ph71.split.us.new.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv110
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv96, i64 %indvars.iv106
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %56, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next97, i64 %indvars.iv110
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next97, i64 %indvars.iv106
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %56, align 8
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %exitcond.1123 = icmp eq i64 %indvars.iv.next97.1, %12
  br i1 %exitcond.1123, label %..preheader_crit_edge.us.loopexit, label %.lr.ph71.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph71.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit119
  br i1 %10, label %.lr.ph68.us.preheader, label %.loopexit.us

.lr.ph68.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod125, label %.lr.ph68.us.prol.loopexit, label %.lr.ph68.us.prol

.lr.ph68.us.prol:                                 ; preds = %.lr.ph68.us.preheader
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv106
  %90 = load double, double* %89, align 8
  %91 = load double, double* %54, align 8
  %92 = load double, double* %56, align 8
  %93 = fmul double %91, %92
  %94 = fsub double %90, %93
  store double %94, double* %89, align 8
  br label %.lr.ph68.us.prol.loopexit

.lr.ph68.us.prol.loopexit:                        ; preds = %.lr.ph68.us.preheader, %.lr.ph68.us.prol
  %indvars.iv100.unr.ph = phi i64 [ 1, %.lr.ph68.us.prol ], [ 0, %.lr.ph68.us.preheader ]
  br i1 %21, label %.loopexit.us, label %.lr.ph68.us.preheader137

.lr.ph68.us.preheader137:                         ; preds = %.lr.ph68.us.prol.loopexit
  br label %.lr.ph68.us

.lr.ph63:                                         ; preds = %.lr.ph63.preheader138, %.lr.ph63
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %.lr.ph63 ], [ %indvars.iv86.unr.ph, %.lr.ph63.preheader138 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv86, i64 %indvars.iv110
  %96 = load double, double* %95, align 8
  %97 = load double, double* %47, align 8
  %98 = fdiv double %96, %97
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv110
  store double %98, double* %99, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next87, i64 %indvars.iv110
  %101 = load double, double* %100, align 8
  %102 = load double, double* %47, align 8
  %103 = fdiv double %101, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next87, i64 %indvars.iv110
  store double %103, double* %104, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next87.1, %12
  br i1 %exitcond.1, label %.preheader57.loopexit, label %.lr.ph63

._crit_edge72.loopexit85:                         ; preds = %.lr.ph71
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep117, i8 0, i64 %25, i32 8, i1 false)
  br label %._crit_edge72

._crit_edge72.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %.preheader57, %._crit_edge72.loopexit85
  %exitcond130 = icmp eq i64 %indvars.iv.next111, %14
  br i1 %exitcond130, label %._crit_edge74.loopexit, label %._crit_edge72..preheader58_crit_edge

._crit_edge72..preheader58_crit_edge:             ; preds = %._crit_edge72
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  br label %.preheader58

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
  br i1 %9, label %.preheader23.us.preheader, label %._crit_edge10

.preheader23.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %._crit_edge7.us, %.preheader23.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader23.us.preheader ], [ %indvars.iv.next22, %._crit_edge7.us ]
  %13 = mul nsw i64 %indvars.iv21, %10
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge, %.preheader23.us
  %indvars.iv17 = phi i64 [ 0, %.preheader23.us ], [ %indvars.iv.next18, %._crit_edge ]
  %14 = add nsw i64 %indvars.iv17, %13
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge28
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge28, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv17
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next18, %11
  br i1 %exitcond26, label %._crit_edge7.us, label %._crit_edge28

._crit_edge7.us:                                  ; preds = %._crit_edge
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next22, %12
  br i1 %exitcond27, label %._crit_edge10.loopexit, label %.preheader23.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge7.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %28 = icmp sgt i32 %0, 0
  %29 = icmp sgt i32 %1, 0
  %or.cond = and i1 %28, %29
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %._crit_edge10
  %30 = sext i32 %1 to i64
  %31 = zext i32 %1 to i64
  %32 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %33 = mul nsw i64 %indvars.iv12, %30
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge29, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge29 ]
  %34 = add nsw i64 %indvars.iv, %33
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 20
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %._crit_edge29

; <label>:38:                                     ; preds = %._crit_edge30
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39) #6
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge30, %38
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %42) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next, %31
  br i1 %exitcond25, label %._crit_edge.us, label %._crit_edge30

._crit_edge.us:                                   ; preds = %._crit_edge29
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %32
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge10
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #6
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
