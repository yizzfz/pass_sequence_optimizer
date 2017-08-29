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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %.._crit_edge32_crit_edge

.._crit_edge32_crit_edge:                         ; preds = %6
  br label %._crit_edge32

.preheader6.lr.ph:                                ; preds = %6
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count54.1 = zext i32 %2 to i64
  %11 = add nsw i64 %wide.trip.count54.1, -2
  %scevgep84 = getelementptr double, double* %5, i64 %8
  %12 = add nsw i64 %9, -1
  %13 = add nsw i64 %8, -4
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %8, -1
  %17 = icmp sgt i32 %1, 0
  %18 = icmp sgt i32 %2, 0
  %19 = icmp eq i32 %xtraiter, 0
  %20 = icmp eq i32 %2, 1
  %sunkaddr76 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter91 = and i64 %15, 3
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  %21 = icmp ult i64 %13, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter90 = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter90, 0
  %22 = icmp ult i64 %12, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next65, %._crit_edge16..preheader6_crit_edge ]
  br i1 %17, label %.preheader5.lr.ph, label %.preheader6.._crit_edge16_crit_edge

.preheader6.._crit_edge16_crit_edge:              ; preds = %.preheader6
  br label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %18, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, label %.preheader5.prol.preheader

.preheader5.preheader..preheader5.prol.loopexit_crit_edge: ; preds = %.preheader5.preheader
  br label %.preheader5.prol.loopexit

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol..preheader5.prol_crit_edge, %.preheader5.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.preheader5.prol..preheader5.prol_crit_edge ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol..preheader5.prol_crit_edge ], [ %xtraiter90, %.preheader5.prol.preheader ]
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol..preheader5.prol_crit_edge, !llvm.loop !1

.preheader5.prol..preheader5.prol_crit_edge:      ; preds = %.preheader5.prol
  br label %.preheader5.prol

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv48.unr = phi i64 [ 0, %.preheader5.preheader..preheader5.prol.loopexit_crit_edge ], [ %indvars.iv.next49.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %22, label %.preheader5.prol.loopexit.._crit_edge16.loopexit89_crit_edge, label %.preheader5.preheader.new

.preheader5.prol.loopexit.._crit_edge16.loopexit89_crit_edge: ; preds = %.preheader5.prol.loopexit
  br label %._crit_edge16.loopexit89

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge14.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit.unr-lcssa:              ; preds = %.lr.ph13.us
  br label %._crit_edge14.us.loopexit

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us.prol.loopexit.._crit_edge14.us.loopexit_crit_edge, %._crit_edge14.us.loopexit.unr-lcssa
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %middle.block.._crit_edge14.us_crit_edge, %._crit_edge14.us.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next63, %9
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %._crit_edge14.us..preheader5.us_crit_edge

._crit_edge14.us..preheader5.us_crit_edge:        ; preds = %._crit_edge14.us
  br label %.preheader5.us

.lr.ph13.us:                                      ; preds = %.lr.ph13.us..lr.ph13.us_crit_edge, %.lr.ph13.us.preheader88.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr, %.lr.ph13.us.preheader88.new ], [ %indvars.iv.next61.3, %.lr.ph13.us..lr.ph13.us_crit_edge ]
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv60
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next61
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61.1
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next61.1
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61.2
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next61.2
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next61.3, %8
  br i1 %exitcond70.3, label %._crit_edge14.us.loopexit.unr-lcssa, label %.lr.ph13.us..lr.ph13.us_crit_edge, !llvm.loop !3

.lr.ph13.us..lr.ph13.us_crit_edge:                ; preds = %.lr.ph13.us
  br label %.lr.ph13.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader5.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.preheader5.us ]
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv56
  store double 0.000000e+00, double* %44, align 8
  br i1 %19, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %45 = load double, double* %23, align 8
  %46 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv56
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %48, 0.000000e+00
  %sunkaddr73 = shl i64 %indvars.iv56, 3
  %sunkaddr74 = add i64 %sunkaddr, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  store double %49, double* %sunkaddr75, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %50 = phi double [ %49, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  %indvars.iv52.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %20, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %51 = sub nsw i64 %11, %indvars.iv52.unr.ph
  %sunkaddr77 = shl i64 %indvars.iv56, 3
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %52 = and i64 %51, -2
  %53 = or i64 %indvars.iv52.unr.ph, 2
  %54 = add nsw i64 %53, %52
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %wide.trip.count58.pre-phi = phi i64 [ 1, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %54, %._crit_edge.us.us.loopexit ]
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58.pre-phi
  br i1 %exitcond59, label %.lr.ph13.us.preheader, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep82 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %8
  br i1 %min.iters.check, label %.lr.ph13.us.preheader..lr.ph13.us.preheader88_crit_edge, label %min.iters.checked

.lr.ph13.us.preheader..lr.ph13.us.preheader88_crit_edge: ; preds = %.lr.ph13.us.preheader
  br label %.lr.ph13.us.preheader88

.lr.ph13.us.preheader88:                          ; preds = %middle.block..lr.ph13.us.preheader88_crit_edge, %vector.memcheck..lr.ph13.us.preheader88_crit_edge, %min.iters.checked..lr.ph13.us.preheader88_crit_edge, %.lr.ph13.us.preheader..lr.ph13.us.preheader88_crit_edge
  %indvars.iv60.ph = phi i64 [ 0, %vector.memcheck..lr.ph13.us.preheader88_crit_edge ], [ 0, %min.iters.checked..lr.ph13.us.preheader88_crit_edge ], [ 0, %.lr.ph13.us.preheader..lr.ph13.us.preheader88_crit_edge ], [ %n.vec, %middle.block..lr.ph13.us.preheader88_crit_edge ]
  %55 = sub nsw i64 %8, %indvars.iv60.ph
  %56 = sub nsw i64 %16, %indvars.iv60.ph
  %xtraiter94 = and i64 %55, 3
  %lcmp.mod95 = icmp eq i64 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph13.us.preheader88..lr.ph13.us.prol.loopexit_crit_edge, label %.lr.ph13.us.prol.preheader

.lr.ph13.us.preheader88..lr.ph13.us.prol.loopexit_crit_edge: ; preds = %.lr.ph13.us.preheader88
  br label %.lr.ph13.us.prol.loopexit

.lr.ph13.us.prol.preheader:                       ; preds = %.lr.ph13.us.preheader88
  br label %.lr.ph13.us.prol

.lr.ph13.us.prol:                                 ; preds = %.lr.ph13.us.prol..lr.ph13.us.prol_crit_edge, %.lr.ph13.us.prol.preheader
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.lr.ph13.us.prol..lr.ph13.us.prol_crit_edge ], [ %indvars.iv60.ph, %.lr.ph13.us.prol.preheader ]
  %prol.iter96 = phi i64 [ %prol.iter96.sub, %.lr.ph13.us.prol..lr.ph13.us.prol_crit_edge ], [ %xtraiter94, %.lr.ph13.us.prol.preheader ]
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv60.prol
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv60.prol
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter96.sub = add i64 %prol.iter96, -1
  %prol.iter96.cmp = icmp eq i64 %prol.iter96.sub, 0
  br i1 %prol.iter96.cmp, label %.lr.ph13.us.prol.loopexit.unr-lcssa, label %.lr.ph13.us.prol..lr.ph13.us.prol_crit_edge, !llvm.loop !6

.lr.ph13.us.prol..lr.ph13.us.prol_crit_edge:      ; preds = %.lr.ph13.us.prol
  br label %.lr.ph13.us.prol

.lr.ph13.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph13.us.prol
  br label %.lr.ph13.us.prol.loopexit

.lr.ph13.us.prol.loopexit:                        ; preds = %.lr.ph13.us.preheader88..lr.ph13.us.prol.loopexit_crit_edge, %.lr.ph13.us.prol.loopexit.unr-lcssa
  %indvars.iv60.unr = phi i64 [ %indvars.iv60.ph, %.lr.ph13.us.preheader88..lr.ph13.us.prol.loopexit_crit_edge ], [ %indvars.iv.next61.prol, %.lr.ph13.us.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %56, 3
  br i1 %62, label %.lr.ph13.us.prol.loopexit.._crit_edge14.us.loopexit_crit_edge, label %.lr.ph13.us.preheader88.new

.lr.ph13.us.prol.loopexit.._crit_edge14.us.loopexit_crit_edge: ; preds = %.lr.ph13.us.prol.loopexit
  br label %._crit_edge14.us.loopexit

.lr.ph13.us.preheader88.new:                      ; preds = %.lr.ph13.us.prol.loopexit
  br label %.lr.ph13.us

min.iters.checked:                                ; preds = %.lr.ph13.us.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph13.us.preheader88_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph13.us.preheader88_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph13.us.preheader88

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ugt double* %scevgep82, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck..lr.ph13.us.preheader88_crit_edge, label %vector.body.preheader

vector.memcheck..lr.ph13.us.preheader88_crit_edge: ; preds = %vector.memcheck
  br label %.lr.ph13.us.preheader88

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod92, label %vector.body.preheader.vector.body.prol.loopexit_crit_edge, label %vector.body.prol.preheader

vector.body.preheader.vector.body.prol.loopexit_crit_edge: ; preds = %vector.body.preheader
  br label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.vector.body.prol_crit_edge, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol.vector.body.prol_crit_edge ], [ 0, %vector.body.prol.preheader ]
  %prol.iter93 = phi i64 [ %prol.iter93.sub, %vector.body.prol.vector.body.prol_crit_edge ], [ %xtraiter91, %vector.body.prol.preheader ]
  %63 = getelementptr inbounds double, double* %5, i64 %index.prol
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !7
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load87.prol = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !7
  %67 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.prol
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %68, align 8, !alias.scope !10, !noalias !7
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load87.prol, <2 x i64>* %70, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter93.sub = add i64 %prol.iter93, -1
  %prol.iter93.cmp = icmp eq i64 %prol.iter93.sub, 0
  br i1 %prol.iter93.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol.vector.body.prol_crit_edge, !llvm.loop !12

vector.body.prol.vector.body.prol_crit_edge:      ; preds = %vector.body.prol
  br label %vector.body.prol

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader.vector.body.prol.loopexit_crit_edge, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader.vector.body.prol.loopexit_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %21, label %vector.body.prol.loopexit.middle.block_crit_edge, label %vector.body.preheader.new

vector.body.prol.loopexit.middle.block_crit_edge: ; preds = %vector.body.prol.loopexit
  br label %middle.block

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body.vector.body_crit_edge ]
  %71 = getelementptr inbounds double, double* %5, i64 %index
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !7
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load87 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !7
  %75 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %76, align 8, !alias.scope !10, !noalias !7
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load87, <2 x i64>* %78, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %79 = getelementptr inbounds double, double* %5, i64 %index.next
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !7
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load87.1 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !7
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %84, align 8, !alias.scope !10, !noalias !7
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load87.1, <2 x i64>* %86, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %87 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !7
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load87.2 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !7
  %91 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.1
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %92, align 8, !alias.scope !10, !noalias !7
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load87.2, <2 x i64>* %94, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %95 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !7
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load87.3 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !7
  %99 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %100, align 8, !alias.scope !10, !noalias !7
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load87.3, <2 x i64>* %102, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %103 = icmp eq i64 %index.next.3, %n.vec
  br i1 %103, label %middle.block.unr-lcssa, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit.middle.block_crit_edge, %middle.block.unr-lcssa
  br i1 %cmp.n, label %middle.block.._crit_edge14.us_crit_edge, label %middle.block..lr.ph13.us.preheader88_crit_edge

middle.block..lr.ph13.us.preheader88_crit_edge:   ; preds = %middle.block
  br label %.lr.ph13.us.preheader88

middle.block.._crit_edge14.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge14.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %104 = phi double [ %116, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %50, %.lr.ph.us.us.new.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv52.unr.ph, %.lr.ph.us.us.new.preheader ]
  %105 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv52
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv56
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fadd double %109, %104
  store double %110, double* %sunkaddr79, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %111 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next53
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv56
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fadd double %115, %110
  store double %116, double* %sunkaddr79, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next53.1, %wide.trip.count54.1
  br i1 %exitcond55.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.preheader5.preheader.new ], [ %indvars.iv.next49.7, %.preheader5..preheader5_crit_edge ]
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next49.7, %9
  br i1 %exitcond.7, label %._crit_edge16.loopexit89.unr-lcssa, label %.preheader5..preheader5_crit_edge

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  br label %.preheader5

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16.loopexit89.unr-lcssa:               ; preds = %.preheader5
  br label %._crit_edge16.loopexit89

._crit_edge16.loopexit89:                         ; preds = %.preheader5.prol.loopexit.._crit_edge16.loopexit89_crit_edge, %._crit_edge16.loopexit89.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader6.._crit_edge16_crit_edge, %._crit_edge16.loopexit89, %._crit_edge16.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next65, %10
  br i1 %exitcond72, label %._crit_edge32.loopexit, label %._crit_edge16..preheader6_crit_edge

._crit_edge16..preheader6_crit_edge:              ; preds = %._crit_edge16
  br label %.preheader6

._crit_edge32.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %.._crit_edge32_crit_edge, %._crit_edge32.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge18.us..preheader7.us_crit_edge, %.preheader7.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next58, %._crit_edge18.us..preheader7.us_crit_edge ]
  br label %.preheader6.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next58, 150
  br i1 %exitcond63, label %.preheader.us.preheader, label %._crit_edge18.us..preheader7.us_crit_edge

._crit_edge18.us..preheader7.us_crit_edge:        ; preds = %._crit_edge18.us
  br label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us..preheader6.us.us_crit_edge, %.preheader7.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge16.us.us..preheader6.us.us_crit_edge ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv53, %indvars.iv57
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond56, label %._crit_edge18.us, label %._crit_edge16.us.us..preheader6.us.us_crit_edge

._crit_edge16.us.us..preheader6.us.us_crit_edge:  ; preds = %._crit_edge16.us.us
  br label %.preheader6.us.us

; <label>:6:                                      ; preds = %._crit_edge, %.preheader6.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next50.1, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv49
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next50
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge16.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %._crit_edge64, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge64 ]
  %21 = mul nuw nsw i64 %indvars.iv46, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv46, %indvars.iv.next
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge64

._crit_edge64:                                    ; preds = %20
  br label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next47, 160
  br i1 %exitcond62, label %._crit_edge9, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us..preheader3.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge11, label %._crit_edge6.us..preheader3.us_crit_edge

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us..preheader.us.us_crit_edge, %.preheader3.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader3.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %._crit_edge5.us.us..preheader.us.us_crit_edge

._crit_edge5.us.us..preheader.us.us_crit_edge:    ; preds = %._crit_edge5.us.us
  br label %.preheader.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us._crit_edge ], [ 0, %.preheader.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.._crit_edge.us.us_crit_edge

.._crit_edge.us.us_crit_edge:                     ; preds = %11
  br label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.._crit_edge.us.us_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us
  br label %11

._crit_edge11:                                    ; preds = %._crit_edge6.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!6 = distinct !{!6, !2}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !4, !5}
