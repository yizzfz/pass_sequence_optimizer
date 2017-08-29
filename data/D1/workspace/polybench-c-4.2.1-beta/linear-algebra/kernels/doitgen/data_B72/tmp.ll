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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph36, label %._crit_edge37

.lr.ph36:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %wide.trip.count63 = zext i32 %2 to i64
  %scevgep78 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter120 = and i64 %17, 3
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter118 = and i64 %11, 7
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  %19 = icmp ult i64 %14, 7
  br label %20

; <label>:20:                                     ; preds = %._crit_edge19, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge19 ]
  br i1 %8, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %20
  br i1 %9, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  br i1 %lcmp.mod119, label %.lr.ph18.split.prol.loopexit, label %.lr.ph18.split.prol.preheader

.lr.ph18.split.prol.preheader:                    ; preds = %.lr.ph18.split.preheader
  br label %.lr.ph18.split.prol

.lr.ph18.split.prol:                              ; preds = %.lr.ph18.split.prol, %.lr.ph18.split.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.lr.ph18.split.prol ], [ 0, %.lr.ph18.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph18.split.prol ], [ %xtraiter118, %.lr.ph18.split.prol.preheader ]
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph18.split.prol.loopexit.unr-lcssa, label %.lr.ph18.split.prol, !llvm.loop !1

.lr.ph18.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph18.split.prol
  br label %.lr.ph18.split.prol.loopexit

.lr.ph18.split.prol.loopexit:                     ; preds = %.lr.ph18.split.preheader, %.lr.ph18.split.prol.loopexit.unr-lcssa
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph18.split.preheader ], [ %indvars.iv.next54.prol, %.lr.ph18.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge19.loopexit115, label %.lr.ph18.split.preheader.new

.lr.ph18.split.preheader.new:                     ; preds = %.lr.ph18.split.prol.loopexit
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph18.split.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge15.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge15.us.loopexit:                        ; preds = %.lr.ph14.us
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %middle.block
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next68, %11
  br i1 %exitcond116, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.lr.ph14.us:                                      ; preds = %.lr.ph14.us.preheader114, %.lr.ph14.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %.lr.ph14.us ], [ %indvars.iv65.ph, %.lr.ph14.us.preheader114 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv65
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %27 = icmp slt i64 %indvars.iv.next66, %10
  br i1 %27, label %.lr.ph14.us, label %._crit_edge15.us.loopexit, !llvm.loop !3

.lr.ph14.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep76 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %10
  br i1 %min.iters.check, label %.lr.ph14.us.preheader114, label %min.iters.checked

.lr.ph14.us.preheader114:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph14.us.preheader
  %indvars.iv65.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph14.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph14.us

min.iters.checked:                                ; preds = %.lr.ph14.us.preheader
  br i1 %cmp.zero, label %.lr.ph14.us.preheader114, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ugt double* %scevgep76, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph14.us.preheader114, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod121, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter122 = phi i64 [ %prol.iter122.sub, %vector.body.prol ], [ %xtraiter120, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load81.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load81.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter122.sub = add i64 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i64 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %36 = getelementptr inbounds double, double* %5, i64 %index
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load81 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load81, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load81.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load81.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load81.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load81.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load81.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load81.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge15.us, label %.lr.ph14.us.preheader114

.lr.ph.us.us:                                     ; preds = %.lr.ph18.split.us, %._crit_edge.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us.us ], [ 0, %.lr.ph18.split.us ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  store double 0.000000e+00, double* %69, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %70 = load double, double* %21, align 8
  %71 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv61
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %73, 0.000000e+00
  store double %74, double* %69, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %75 = phi double [ %74, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv57.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.lr.ph14.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %76 = phi double [ %88, %.lr.ph.us.us.new ], [ %75, %.lr.ph.us.us.new.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %.lr.ph.us.us.new ], [ %indvars.iv57.unr.ph, %.lr.ph.us.us.new.preheader ]
  %77 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv57
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv61
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %69, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next58
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next58, i64 %indvars.iv61
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %69, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count63
  br i1 %exitcond60.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph18.split:                                   ; preds = %.lr.ph18.split, %.lr.ph18.split.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.lr.ph18.split.preheader.new ], [ %indvars.iv.next54.7, %.lr.ph18.split ]
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next54.7, %11
  br i1 %exitcond.7, label %._crit_edge19.loopexit115.unr-lcssa, label %.lr.ph18.split

._crit_edge19.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge19

._crit_edge19.loopexit115.unr-lcssa:              ; preds = %.lr.ph18.split
  br label %._crit_edge19.loopexit115

._crit_edge19.loopexit115:                        ; preds = %.lr.ph18.split.prol.loopexit, %._crit_edge19.loopexit115.unr-lcssa
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit115, %._crit_edge19.loopexit, %20
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next70, %12
  br i1 %exitcond117, label %._crit_edge37.loopexit, label %20

._crit_edge37.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.lr.ph26:
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph26
  %indvars.iv61 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next62, %._crit_edge20.us ]
  br label %.lr.ph15.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next62, 150
  br i1 %exitcond67, label %.lr.ph7.split.us.preheader, label %.lr.ph26.split.us

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge20.us
  br label %.lr.ph7.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph26.split.us, %._crit_edge16.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge16.us.us ], [ 0, %.lr.ph26.split.us ]
  %2 = mul nuw nsw i64 %indvars.iv61, %indvars.iv57
  br label %3

._crit_edge16.us.us:                              ; preds = %3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond60, label %._crit_edge20.us, label %.lr.ph15.us.us

; <label>:3:                                      ; preds = %3, %.lr.ph15.us.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next54.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv53
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next54
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, 160
  br i1 %exitcond56.1, label %._crit_edge16.us.us, label %3

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv50, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv50, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond66, label %._crit_edge8, label %.lr.ph7.split.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.lr.ph14:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge8.us, %.lr.ph14
  %indvars.iv42 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next43, %._crit_edge8.us ]
  %5 = mul nuw nsw i64 %indvars.iv42, 140
  br label %.lr.ph.us.us

._crit_edge8.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 150
  br i1 %exitcond, label %._crit_edge15, label %.lr.ph14.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph14.split.us, %._crit_edge5.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge5.us.us ], [ 0, %.lr.ph14.split.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv38
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 140
  br i1 %exitcond41, label %._crit_edge8.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond37, label %._crit_edge5.us.us, label %8

._crit_edge15:                                    ; preds = %._crit_edge8.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2}
!12 = distinct !{!12, !4, !5}
