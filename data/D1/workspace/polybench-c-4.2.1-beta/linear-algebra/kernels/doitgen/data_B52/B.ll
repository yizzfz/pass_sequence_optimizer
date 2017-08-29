; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %2 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  %scevgep65 = getelementptr double, double* %5, i64 %wide.trip.count45
  %10 = add nsw i64 %wide.trip.count45, -1
  %xtraiter103 = and i64 %wide.trip.count45, 1
  %lcmp.mod104 = icmp eq i64 %xtraiter103, 0
  %11 = icmp eq i32 %2, 1
  %min.iters.check = icmp ult i32 %2, 4
  %12 = and i32 %2, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count45, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge13, %.preheader5.lr.ph
  %indvars.iv54 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next55, %._crit_edge13 ]
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %.preheader5
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 0
  %scevgep63 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %wide.trip.count45
  br i1 true, label %.lr.ph.us.us.preheader, label %..preheader_crit_edge.us.loopexit22

.lr.ph.us.us.preheader:                           ; preds = %.preheader4.us
  %13 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit.unr-lcssa:              ; preds = %._crit_edge
  br label %._crit_edge11.us.loopexit

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.prol.loopexit, %._crit_edge11.us.loopexit.unr-lcssa
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %..preheader_crit_edge.us.._crit_edge11.us_crit_edge, %._crit_edge11.us.loopexit, %middle.block
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge13.loopexit, label %.preheader4.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader100.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr, %._crit_edge.preheader100.new ], [ %indvars.iv.next44.3, %._crit_edge ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  %15 = bitcast double* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv43
  %18 = bitcast double* %17 to i64*
  store i64 %16, i64* %18, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv.next44
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44.1
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv.next44.1
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next44.2 = add nsw i64 %indvars.iv43, 3
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44.2
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv.next44.2
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next44.3 = add nsw i64 %indvars.iv43, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next44.3, %wide.trip.count45
  br i1 %exitcond46.3, label %._crit_edge11.us.loopexit.unr-lcssa, label %._crit_edge, !llvm.loop !1

..preheader_crit_edge.us.loopexit22:              ; preds = %.preheader4.us
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us.loopexit:                ; preds = %._crit_edge.us.us
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %..preheader_crit_edge.us.loopexit22
  br i1 true, label %._crit_edge.preheader, label %..preheader_crit_edge.us.._crit_edge11.us_crit_edge

..preheader_crit_edge.us.._crit_edge11.us_crit_edge: ; preds = %..preheader_crit_edge.us
  br label %._crit_edge11.us

._crit_edge.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %min.iters.check, label %._crit_edge.preheader100, label %min.iters.checked

._crit_edge.preheader100:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge.preheader
  %indvars.iv43.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge.preheader ], [ %n.vec, %middle.block ]
  %34 = sub nsw i64 %wide.trip.count45, %indvars.iv43.ph
  %35 = sub nsw i64 %10, %indvars.iv43.ph
  %xtraiter105 = and i64 %34, 3
  %lcmp.mod106 = icmp eq i64 %xtraiter105, 0
  br i1 %lcmp.mod106, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %._crit_edge.preheader100
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %indvars.iv43.prol = phi i64 [ %indvars.iv.next44.prol, %._crit_edge.prol ], [ %indvars.iv43.ph, %._crit_edge.prol.preheader ]
  %prol.iter107 = phi i64 [ %prol.iter107.sub, %._crit_edge.prol ], [ %xtraiter105, %._crit_edge.prol.preheader ]
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv43.prol
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv43.prol
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next44.prol = add nuw nsw i64 %indvars.iv43.prol, 1
  %prol.iter107.sub = add i64 %prol.iter107, -1
  %prol.iter107.cmp = icmp eq i64 %prol.iter107.sub, 0
  br i1 %prol.iter107.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !4

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.preheader100, %._crit_edge.prol.loopexit.unr-lcssa
  %indvars.iv43.unr = phi i64 [ %indvars.iv43.ph, %._crit_edge.preheader100 ], [ %indvars.iv.next44.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  %41 = icmp ult i64 %35, 3
  br i1 %41, label %._crit_edge11.us.loopexit, label %._crit_edge.preheader100.new

._crit_edge.preheader100.new:                     ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

min.iters.checked:                                ; preds = %._crit_edge.preheader
  br i1 %cmp.zero, label %._crit_edge.preheader100, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep65
  %bound1 = icmp ugt double* %scevgep63, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.preheader100, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %index
  %43 = bitcast double* %42 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %43, align 8, !alias.scope !6
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load68 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %index
  %47 = bitcast double* %46 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %47, align 8, !alias.scope !9, !noalias !6
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load68, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %50 = icmp eq i64 %index.next, %n.vec
  br i1 %50, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge11.us, label %._crit_edge.preheader100

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %51 = getelementptr inbounds double, double* %5, i64 %indvars.iv39
  store double 0.000000e+00, double* %51, align 8
  br i1 %lcmp.mod104, label %._crit_edge58.prol.loopexit.unr-lcssa, label %._crit_edge58.prol.preheader

._crit_edge58.prol.preheader:                     ; preds = %.lr.ph.us.us
  br label %._crit_edge58.prol

._crit_edge58.prol:                               ; preds = %._crit_edge58.prol.preheader
  %52 = load double, double* %13, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv39
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, 0.000000e+00
  store double %56, double* %51, align 8
  br label %._crit_edge58.prol.loopexit.unr-lcssa

._crit_edge58.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge58.prol
  %indvars.iv35.unr.ph = phi i64 [ 1, %._crit_edge58.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %56, %._crit_edge58.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  br label %._crit_edge58.prol.loopexit

._crit_edge58.prol.loopexit:                      ; preds = %._crit_edge58.prol.loopexit.unr-lcssa
  br i1 %11, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge58.prol.loopexit
  br label %._crit_edge58

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge58
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge58.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count45
  br i1 %exitcond42, label %..preheader_crit_edge.us.loopexit, label %.lr.ph.us.us

._crit_edge58:                                    ; preds = %._crit_edge58, %.lr.ph.us.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next36.1, %._crit_edge58 ]
  %57 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %69, %._crit_edge58 ]
  %58 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv35
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv39
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %51, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv.next36
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next36, i64 %indvars.iv39
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %51, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count45
  br i1 %exitcond38.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge58

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge11
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge11 ], [ 0, %.preheader4.preheader ]
  br i1 false, label %.lr.ph10.preheader, label %._crit_edge11

.lr.ph10.preheader:                               ; preds = %.preheader4
  br i1 undef, label %.lr.ph10.preheader101, label %min.iters.checked73

min.iters.checked73:                              ; preds = %.lr.ph10.preheader
  br i1 undef, label %.lr.ph10.preheader101, label %vector.memcheck88

vector.memcheck88:                                ; preds = %min.iters.checked73
  br i1 undef, label %.lr.ph10.preheader101, label %vector.body69.preheader

vector.body69.preheader:                          ; preds = %vector.memcheck88
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69.preheader, %vector.body69
  br i1 true, label %middle.block70, label %vector.body69, !llvm.loop !12

middle.block70:                                   ; preds = %vector.body69
  br i1 undef, label %middle.block70.._crit_edge11_crit_edge, label %.lr.ph10.preheader101

middle.block70.._crit_edge11_crit_edge:           ; preds = %middle.block70
  br label %._crit_edge11

.lr.ph10.preheader101:                            ; preds = %middle.block70, %vector.memcheck88, %min.iters.checked73, %.lr.ph10.preheader
  br i1 undef, label %.lr.ph10.prol.preheader, label %.lr.ph10.prol.loopexit

.lr.ph10.prol.preheader:                          ; preds = %.lr.ph10.preheader101
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol, %.lr.ph10.prol.preheader
  br i1 false, label %.lr.ph10.prol, label %.lr.ph10.prol.loopexit.unr-lcssa, !llvm.loop !13

.lr.ph10.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.prol
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol.loopexit.unr-lcssa, %.lr.ph10.preheader101
  br i1 undef, label %._crit_edge11.loopexit, label %.lr.ph10.preheader101.new

.lr.ph10.preheader101.new:                        ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10, %.lr.ph10.preheader101.new
  br i1 true, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10, !llvm.loop !14

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.prol.loopexit, %._crit_edge11.loopexit.unr-lcssa
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %middle.block70.._crit_edge11_crit_edge, %._crit_edge11.loopexit, %.preheader4
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count52
  br i1 %exitcond30, label %._crit_edge13.loopexit102, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13.loopexit102:                        ; preds = %._crit_edge11
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit102, %._crit_edge13.loopexit, %.preheader5
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
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
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader6.lr.ph, label %.preheader4

.preheader6.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %2, 0
  %9 = sitofp i32 %2 to double
  br i1 %7, label %.preheader6.us.preheader, label %.preheader4

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count43 = zext i32 %0 to i64
  %wide.trip.count35 = zext i32 %2 to i64
  %wide.trip.count39 = zext i32 %1 to i64
  %xtraiter47 = and i64 %wide.trip.count35, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  %10 = icmp eq i32 %2, 1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge15.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge15.us ], [ 0, %.preheader6.us.preheader ]
  br i1 %8, label %.preheader5.us.us.preheader, label %._crit_edge15.us

.preheader5.us.us.preheader:                      ; preds = %.preheader6.us
  br label %.preheader5.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge13.us.us
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.preheader6.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %.preheader4.loopexit, label %.preheader6.us

.preheader5.us.us:                                ; preds = %.preheader5.us.us.preheader, %._crit_edge13.us.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge13.us.us ], [ 0, %.preheader5.us.us.preheader ]
  %11 = mul nuw nsw i64 %indvars.iv37, %indvars.iv41
  br i1 %lcmp.mod48, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader5.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, %2
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %9
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv41, i64 %indvars.iv37, i64 0
  store double %15, double* %16, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.us.us, %._crit_edge.prol
  %indvars.iv33.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.preheader5.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %10, label %._crit_edge13.us.us, label %.preheader5.us.us.new

.preheader5.us.us.new:                            ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge13.us.us.unr-lcssa:                    ; preds = %._crit_edge
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge.prol.loopexit, %._crit_edge13.us.us.unr-lcssa
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge15.us.loopexit, label %.preheader5.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader5.us.us.new
  %indvars.iv33 = phi i64 [ %indvars.iv33.unr.ph, %.preheader5.us.us.new ], [ %indvars.iv.next34.1, %._crit_edge ]
  %17 = add nuw nsw i64 %indvars.iv33, %11
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %2
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %9
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv33
  store double %21, double* %22, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %23 = add nuw nsw i64 %indvars.iv.next34, %11
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %9
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv.next34
  store double %27, double* %28, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next34.1, %wide.trip.count35
  br i1 %exitcond36.1, label %._crit_edge13.us.us.unr-lcssa, label %._crit_edge

.preheader4.loopexit:                             ; preds = %._crit_edge15.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader6.lr.ph, %5
  %29 = icmp sgt i32 %2, 0
  br i1 %29, label %.preheader.lr.ph, label %._crit_edge10

.preheader.lr.ph:                                 ; preds = %.preheader4
  %30 = sitofp i32 %2 to double
  %wide.trip.count = zext i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %31 = fdiv double 0.000000e+00, %30
  %32 = icmp eq i32 %2, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge.us ]
  br i1 %lcmp.mod, label %._crit_edge46.prol.loopexit.unr-lcssa, label %._crit_edge46.prol.preheader

._crit_edge46.prol.preheader:                     ; preds = %.preheader.us
  br label %._crit_edge46.prol

._crit_edge46.prol:                               ; preds = %._crit_edge46.prol.preheader
  %33 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 0
  store double %31, double* %33, align 8
  br label %._crit_edge46.prol.loopexit.unr-lcssa

._crit_edge46.prol.loopexit.unr-lcssa:            ; preds = %.preheader.us, %._crit_edge46.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge46.prol ], [ 0, %.preheader.us ]
  br label %._crit_edge46.prol.loopexit

._crit_edge46.prol.loopexit:                      ; preds = %._crit_edge46.prol.loopexit.unr-lcssa
  br i1 %32, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge46.prol.loopexit
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %._crit_edge46 ]
  %34 = mul nuw nsw i64 %indvars.iv, %indvars.iv28
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, %2
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %30
  %39 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %2
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %30
  %45 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %44, double* %45, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge46

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge46
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge46.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count
  br i1 %exitcond31, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %4
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader3.us.preheader, label %._crit_edge8

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %12 = sext i32 %1 to i64
  %wide.trip.count26 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count22 = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.us.preheader
  %indvars.iv24 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next25, %._crit_edge6.us ]
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge6.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %13 = mul nsw i64 %indvars.iv24, %12
  %14 = trunc i64 %13 to i32
  br label %.preheader.us.us

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.preheader3.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %._crit_edge8.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %15 = trunc i64 %indvars.iv20 to i32
  %16 = add i32 %15, %14
  %17 = mul i32 %16, %2
  %18 = zext i32 %17 to i64
  br label %._crit_edge29

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge6.us.loopexit, label %.preheader.us.us

._crit_edge29:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %19 = add i64 %indvars.iv, %18
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %._crit_edge29
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge29, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond19, label %._crit_edge.us.us, label %._crit_edge29

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3.lr.ph, %4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2, !3}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !5}
!14 = distinct !{!14, !2, !3}
