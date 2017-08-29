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
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader4.lr.ph, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %5
  br label %.preheader3

.preheader4.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader4.us.preheader, label %.preheader4.lr.ph.._crit_edge7_crit_edge

.preheader4.lr.ph.._crit_edge7_crit_edge:         ; preds = %.preheader4.lr.ph
  br label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next23, %._crit_edge10.us..preheader4.us_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader4.us
  %indvars.iv18 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next19, %._crit_edge.._crit_edge_crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv18, %indvars.iv22
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %8
  %16 = fmul double %15, 1.000000e+02
  %17 = fadd double %16, 1.000000e+01
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv18
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv18
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %9
  br i1 %exitcond, label %._crit_edge10.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge10.us:                                 ; preds = %._crit_edge
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next23, %10
  br i1 %exitcond31, label %.preheader3.loopexit, label %._crit_edge10.us..preheader4.us_crit_edge

._crit_edge10.us..preheader4.us_crit_edge:        ; preds = %._crit_edge10.us
  br label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge10.us
  br label %.preheader3

.preheader3:                                      ; preds = %..preheader3_crit_edge, %.preheader3.loopexit
  %20 = icmp sgt i32 %1, 0
  br i1 %20, label %.preheader.us.preheader, label %.preheader3.._crit_edge7_crit_edge

.preheader3.._crit_edge7_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %21 = zext i32 %1 to i64
  %22 = shl nuw nsw i64 %21, 3
  %23 = add nsw i64 %21, -1
  %xtraiter = and i64 %21, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.preheader..preheader.us.prol.loopexit_crit_edge, label %._crit_edge.us.prol.preheader

.preheader.us.preheader..preheader.us.prol.loopexit_crit_edge: ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol.loopexit

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, %._crit_edge.us.prol.preheader
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next15.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14.prol, i64 0
  %scevgep28.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !1

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader..preheader.us.prol.loopexit_crit_edge, %.preheader.us.prol.loopexit.loopexit
  %indvars.iv14.unr = phi i64 [ 0, %.preheader.us.preheader..preheader.us.prol.loopexit_crit_edge ], [ %indvars.iv.next15.prol, %.preheader.us.prol.loopexit.loopexit ]
  %24 = icmp ult i64 %23, 3
  br i1 %24, label %.preheader.us.prol.loopexit.._crit_edge7_crit_edge, label %._crit_edge.us.3.preheader

.preheader.us.prol.loopexit.._crit_edge7_crit_edge: ; preds = %.preheader.us.prol.loopexit
  br label %._crit_edge7

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %25 = add nsw i64 %21, -4
  %26 = sub i64 %25, %indvars.iv14.unr
  %27 = lshr i64 %26, 2
  %28 = and i64 %27, 1
  %lcmp.mod33 = icmp eq i64 %28, 0
  br i1 %lcmp.mod33, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.preheader.._crit_edge.us.3.prol.loopexit_crit_edge

._crit_edge.us.3.preheader.._crit_edge.us.3.prol.loopexit_crit_edge: ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol35 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14.unr, i64 0
  %scevgep28.prol36 = bitcast double* %scevgep.prol35 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol36, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.prol37 = add nuw nsw i64 %indvars.iv14.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.prol37, i64 0
  %scevgep28.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.1.prol = add nsw i64 %indvars.iv14.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1.prol, i64 0
  %scevgep28.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.2.prol = add nsw i64 %indvars.iv14.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2.prol, i64 0
  %scevgep28.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.3.prol = add nsw i64 %indvars.iv14.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.preheader.._crit_edge.us.3.prol.loopexit_crit_edge, %._crit_edge.us.3.prol
  %indvars.iv14.unr38 = phi i64 [ %indvars.iv14.unr, %._crit_edge.us.3.preheader.._crit_edge.us.3.prol.loopexit_crit_edge ], [ %indvars.iv.next15.3.prol, %._crit_edge.us.3.prol ]
  %29 = icmp eq i64 %27, 0
  br i1 %29, label %._crit_edge.us.3.prol.loopexit.._crit_edge7.loopexit_crit_edge, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.prol.loopexit.._crit_edge7.loopexit_crit_edge: ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge7.loopexit

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge7.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  br label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us.3.prol.loopexit.._crit_edge7.loopexit_crit_edge, %._crit_edge7.loopexit.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.preheader.us.prol.loopexit.._crit_edge7_crit_edge, %.preheader3.._crit_edge7_crit_edge, %.preheader4.lr.ph.._crit_edge7_crit_edge, %._crit_edge7.loopexit
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3.._crit_edge.us.3_crit_edge, %._crit_edge.us.3.preheader.new
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr38, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next15.3.1, %._crit_edge.us.3.._crit_edge.us.3_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 0
  %scevgep28 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15, i64 0
  %scevgep28.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1, i64 0
  %scevgep28.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv14, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2, i64 0
  %scevgep28.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv14, 4
  %scevgep.139 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.3, i64 0
  %scevgep28.140 = bitcast double* %scevgep.139 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.140, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.141 = add nsw i64 %indvars.iv14, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.141, i64 0
  %scevgep28.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.1.1 = add nsw i64 %indvars.iv14, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1.1, i64 0
  %scevgep28.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.2.1 = add nsw i64 %indvars.iv14, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2.1, i64 0
  %scevgep28.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next15.3.1 = add nsw i64 %indvars.iv14, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next15.3.1, %21
  br i1 %exitcond.3.1, label %._crit_edge7.loopexit.unr-lcssa, label %._crit_edge.us.3.._crit_edge.us.3_crit_edge

._crit_edge.us.3.._crit_edge.us.3_crit_edge:      ; preds = %._crit_edge.us.3
  br label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %.._crit_edge21_crit_edge

.._crit_edge21_crit_edge:                         ; preds = %5
  br label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %5
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
  %xtraiter62 = and i64 %9, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  %15 = icmp eq i64 %10, 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19..preheader5_crit_edge, %.preheader5.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next58, %._crit_edge19..preheader5_crit_edge ]
  %indvars.iv51 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next52, %._crit_edge19..preheader5_crit_edge ]
  %16 = mul i64 %indvars.iv57, 1201
  %17 = add i64 %16, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %17
  %scevgep64 = bitcast double* %scevgep to i8*
  %18 = mul i64 %indvars.iv57, -8
  %19 = add i64 %13, %18
  br i1 %7, label %.lr.ph, label %.preheader5.._crit_edge_crit_edge

.preheader5.._crit_edge_crit_edge:                ; preds = %.preheader5
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.07.prol = phi double [ %23, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv57
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fadd double %.07.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %.lcssa.unr = phi double [ undef, %.lr.ph..prol.loopexit_crit_edge ], [ %23, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph..prol.loopexit_crit_edge ], [ %23, %.prol.loopexit.loopexit ]
  br i1 %14, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.07 = phi double [ %39, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.07.unr, %.lr.ph.new.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv57
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %25
  %27 = fadd double %.07, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv57
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %29
  %31 = fadd double %27, %30
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv57
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv57
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond61.3, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader5.._crit_edge_crit_edge, %._crit_edge.loopexit
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5.._crit_edge_crit_edge ], [ %.lcssa.unr, %.prol.loopexit.._crit_edge_crit_edge ], [ %39, %._crit_edge.loopexit ]
  %40 = tail call double @sqrt(double %.0.lcssa) #4
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv57
  store double %40, double* %41, align 8
  br i1 %7, label %.lr.ph10.preheader, label %._crit_edge..preheader4_crit_edge

._crit_edge..preheader4_crit_edge:                ; preds = %._crit_edge
  br label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod63, label %.lr.ph10.preheader..lr.ph10.prol.loopexit_crit_edge, label %.lr.ph10.prol

.lr.ph10.preheader..lr.ph10.prol.loopexit_crit_edge: ; preds = %.lr.ph10.preheader
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv57
  %43 = load double, double* %42, align 8
  %44 = fdiv double %43, %40
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv57
  store double %44, double* %45, align 8
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.preheader..lr.ph10.prol.loopexit_crit_edge, %.lr.ph10.prol
  %indvars.iv33.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader..lr.ph10.prol.loopexit_crit_edge ]
  br i1 %15, label %.lr.ph10.prol.loopexit..preheader4_crit_edge, label %.lr.ph10.preheader85

.lr.ph10.prol.loopexit..preheader4_crit_edge:     ; preds = %.lr.ph10.prol.loopexit
  br label %.preheader4

.lr.ph10.preheader85:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  br label %.preheader4

.preheader4:                                      ; preds = %.lr.ph10.prol.loopexit..preheader4_crit_edge, %._crit_edge..preheader4_crit_edge, %.preheader4.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %46 = icmp slt i64 %indvars.iv.next58, %8
  br i1 %46, label %.lr.ph18, label %.preheader4.._crit_edge19_crit_edge

.preheader4.._crit_edge19_crit_edge:              ; preds = %.preheader4
  br label %._crit_edge19

.lr.ph18:                                         ; preds = %.preheader4
  br i1 %7, label %.lr.ph18.split.us.preheader, label %._crit_edge19.loopexit32

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv57
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.loopexit.us..lr.ph18.split.us_crit_edge, %.lr.ph18.split.us.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv51, %.lr.ph18.split.us.preheader ], [ %indvars.iv.next54, %.loopexit.us..lr.ph18.split.us_crit_edge ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv53
  store double 0.000000e+00, double* %48, align 8
  br i1 %lcmp.mod63, label %.lr.ph18.split.us..prol.loopexit66_crit_edge, label %.prol.preheader65

.lr.ph18.split.us..prol.loopexit66_crit_edge:     ; preds = %.lr.ph18.split.us
  br label %.prol.loopexit66

.prol.preheader65:                                ; preds = %.lr.ph18.split.us
  %49 = load double, double* %47, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv53
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, 0.000000e+00
  store double %53, double* %48, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.lr.ph18.split.us..prol.loopexit66_crit_edge, %.prol.preheader65
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.lr.ph18.split.us..prol.loopexit66_crit_edge ]
  %.unr.ph = phi double [ %53, %.prol.preheader65 ], [ 0.000000e+00, %.lr.ph18.split.us..prol.loopexit66_crit_edge ]
  br i1 %15, label %.prol.loopexit66..lr.ph15.us.preheader_crit_edge, label %.lr.ph18.split.us.new.preheader

.prol.loopexit66..lr.ph15.us.preheader_crit_edge: ; preds = %.prol.loopexit66
  br label %.lr.ph15.us.preheader

.lr.ph18.split.us.new.preheader:                  ; preds = %.prol.loopexit66
  br label %.lr.ph18.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.lr.ph15.us.prol.loopexit..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond = icmp eq i64 %indvars.iv.next54, %11
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.loopexit.us..lr.ph18.split.us_crit_edge

.loopexit.us..lr.ph18.split.us_crit_edge:         ; preds = %.loopexit.us
  br label %.lr.ph18.split.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us..lr.ph15.us_crit_edge, %.lr.ph15.us.preheader84
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph15.us..lr.ph15.us_crit_edge ], [ %indvars.iv47.unr.ph, %.lr.ph15.us.preheader84 ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv53
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv57
  %57 = load double, double* %56, align 8
  %58 = load double, double* %48, align 8
  %59 = fmul double %57, %58
  %60 = fsub double %55, %59
  store double %60, double* %54, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next48, i64 %indvars.iv53
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next48, i64 %indvars.iv57
  %64 = load double, double* %63, align 8
  %65 = load double, double* %48, align 8
  %66 = fmul double %64, %65
  %67 = fsub double %62, %66
  store double %67, double* %61, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond.174 = icmp eq i64 %indvars.iv.next48.1, %9
  br i1 %exitcond.174, label %.loopexit.us.loopexit, label %.lr.ph15.us..lr.ph15.us_crit_edge

.lr.ph15.us..lr.ph15.us_crit_edge:                ; preds = %.lr.ph15.us
  br label %.lr.ph15.us

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge, %.lr.ph18.split.us.new.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge ], [ %indvars.iv43.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %68 = phi double [ %80, %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge ], [ %.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv57
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv53
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %48, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next44, i64 %indvars.iv57
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next44, i64 %indvars.iv53
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %74, %79
  store double %80, double* %48, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond.170 = icmp eq i64 %indvars.iv.next44.1, %9
  br i1 %exitcond.170, label %.lr.ph15.us.preheader.loopexit, label %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge

.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge: ; preds = %.lr.ph18.split.us.new
  br label %.lr.ph18.split.us.new

.lr.ph15.us.preheader.loopexit:                   ; preds = %.lr.ph18.split.us.new
  br label %.lr.ph15.us.preheader

.lr.ph15.us.preheader:                            ; preds = %.prol.loopexit66..lr.ph15.us.preheader_crit_edge, %.lr.ph15.us.preheader.loopexit
  %81 = phi double [ %.unr.ph, %.prol.loopexit66..lr.ph15.us.preheader_crit_edge ], [ %80, %.lr.ph15.us.preheader.loopexit ]
  br i1 %lcmp.mod63, label %.lr.ph15.us.preheader..lr.ph15.us.prol.loopexit_crit_edge, label %.lr.ph15.us.prol

.lr.ph15.us.preheader..lr.ph15.us.prol.loopexit_crit_edge: ; preds = %.lr.ph15.us.preheader
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.preheader
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv53
  %83 = load double, double* %82, align 8
  %84 = load double, double* %47, align 8
  %85 = fmul double %84, %81
  %86 = fsub double %83, %85
  store double %86, double* %82, align 8
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.preheader..lr.ph15.us.prol.loopexit_crit_edge, %.lr.ph15.us.prol
  %indvars.iv47.unr.ph = phi i64 [ 1, %.lr.ph15.us.prol ], [ 0, %.lr.ph15.us.preheader..lr.ph15.us.prol.loopexit_crit_edge ]
  br i1 %15, label %.lr.ph15.us.prol.loopexit..loopexit.us_crit_edge, label %.lr.ph15.us.preheader84

.lr.ph15.us.prol.loopexit..loopexit.us_crit_edge: ; preds = %.lr.ph15.us.prol.loopexit
  br label %.loopexit.us

.lr.ph15.us.preheader84:                          ; preds = %.lr.ph15.us.prol.loopexit
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10..lr.ph10_crit_edge, %.lr.ph10.preheader85
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph10..lr.ph10_crit_edge ], [ %indvars.iv33.unr.ph, %.lr.ph10.preheader85 ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv57
  %88 = load double, double* %87, align 8
  %89 = load double, double* %41, align 8
  %90 = fdiv double %88, %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv57
  store double %90, double* %91, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv57
  %93 = load double, double* %92, align 8
  %94 = load double, double* %41, align 8
  %95 = fdiv double %93, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next34, i64 %indvars.iv57
  store double %95, double* %96, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, %9
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.lr.ph10..lr.ph10_crit_edge

.lr.ph10..lr.ph10_crit_edge:                      ; preds = %.lr.ph10
  br label %.lr.ph10

._crit_edge19.loopexit32:                         ; preds = %.lr.ph18
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep64, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge19

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %.preheader4.._crit_edge19_crit_edge, %._crit_edge19.loopexit, %._crit_edge19.loopexit32
  %exitcond77 = icmp eq i64 %indvars.iv.next58, %11
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %._crit_edge19..preheader5_crit_edge

._crit_edge19..preheader5_crit_edge:              ; preds = %._crit_edge19
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.._crit_edge21_crit_edge, %._crit_edge21.loopexit
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
  br i1 %9, label %.preheader4.us.preheader, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %4
  br label %._crit_edge14

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next26, %._crit_edge11.us..preheader4.us_crit_edge ]
  %12 = mul nsw i64 %indvars.iv25, %10
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge.._crit_edge32_crit_edge, %.preheader4.us
  %indvars.iv21 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next22, %._crit_edge.._crit_edge32_crit_edge ]
  %13 = add nsw i64 %indvars.iv21, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge32.._crit_edge_crit_edge

._crit_edge32.._crit_edge_crit_edge:              ; preds = %._crit_edge32
  br label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge32
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge32.._crit_edge_crit_edge, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next22, %11
  br i1 %exitcond30, label %._crit_edge11.us, label %._crit_edge.._crit_edge32_crit_edge

._crit_edge.._crit_edge32_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge32

._crit_edge11.us:                                 ; preds = %._crit_edge
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next26, %11
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %._crit_edge11.us..preheader4.us_crit_edge

._crit_edge11.us..preheader4.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader4.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %27 = icmp sgt i32 %0, 0
  %or.cond = and i1 %27, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14.._crit_edge8_crit_edge

._crit_edge14.._crit_edge8_crit_edge:             ; preds = %._crit_edge14
  br label %._crit_edge8

.preheader.us.preheader:                          ; preds = %._crit_edge14
  %28 = sext i32 %1 to i64
  %29 = zext i32 %1 to i64
  %30 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %31 = mul nsw i64 %indvars.iv16, %28
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge33.._crit_edge34_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge33.._crit_edge34_crit_edge ]
  %32 = add nsw i64 %indvars.iv, %31
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 20
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %._crit_edge34.._crit_edge33_crit_edge

._crit_edge34.._crit_edge33_crit_edge:            ; preds = %._crit_edge34
  br label %._crit_edge33

; <label>:36:                                     ; preds = %._crit_edge34
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %37) #6
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge34.._crit_edge33_crit_edge, %36
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %40) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %29
  br i1 %exitcond29, label %._crit_edge.us, label %._crit_edge33.._crit_edge34_crit_edge

._crit_edge33.._crit_edge34_crit_edge:            ; preds = %._crit_edge33
  br label %._crit_edge34

._crit_edge.us:                                   ; preds = %._crit_edge33
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %30
  br i1 %exitcond, label %._crit_edge8.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge14.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %44) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
