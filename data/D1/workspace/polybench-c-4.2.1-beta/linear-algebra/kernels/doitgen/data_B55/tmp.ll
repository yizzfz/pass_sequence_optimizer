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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph29, label %._crit_edge

.lr.ph29:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %11 = sext i32 %2 to i64
  %12 = sext i32 %0 to i64
  %wide.trip.count68 = zext i32 %2 to i64
  %xtraiter84 = and i32 %2, 3
  %lcmp.mod85 = icmp eq i32 %xtraiter84, 0
  %13 = icmp ult i32 %10, 3
  %wide.trip.count76 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter84, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count76, -1
  %xtraiter92 = and i64 %11, 1
  %lcmp.mod93 = icmp eq i64 %xtraiter92, 0
  %18 = icmp eq i32 %2, 1
  %xtraiter = and i64 %wide.trip.count76, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %17, 7
  br label %._crit_edge21._crit_edge

._crit_edge21._crit_edge:                         ; preds = %._crit_edge21, %.lr.ph29
  %indvars.iv78 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next79, %._crit_edge21 ]
  br i1 %8, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %._crit_edge21._crit_edge
  br i1 %9, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next57.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge21.loopexit90, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge17.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82.preheader

.prol.preheader82.preheader:                      ; preds = %._crit_edge9.us.loopexit
  br label %.prol.preheader82

.prol.preheader82:                                ; preds = %.prol.preheader82.preheader, %.prol.preheader82
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %.prol.preheader82 ], [ 0, %.prol.preheader82.preheader ]
  %prol.iter86 = phi i32 [ %prol.iter86.sub, %.prol.preheader82 ], [ %xtraiter84, %.prol.preheader82.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv70.prol
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70.prol
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter86.sub = add nsw i32 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i32 %prol.iter86.sub, 0
  br i1 %prol.iter86.cmp, label %.prol.loopexit83.loopexit, label %.prol.preheader82, !llvm.loop !3

.prol.loopexit83.loopexit:                        ; preds = %.prol.preheader82
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.loopexit83.loopexit, %._crit_edge9.us.loopexit
  %indvars.iv70.unr = phi i64 [ 0, %._crit_edge9.us.loopexit ], [ %16, %.prol.loopexit83.loopexit ]
  br i1 %13, label %._crit_edge17.us, label %.lr.ph16.us.new.preheader

.lr.ph16.us.new.preheader:                        ; preds = %.prol.loopexit83
  br label %.lr.ph16.us.new

.lr.ph16.us.new:                                  ; preds = %.lr.ph16.us.new.preheader, %.lr.ph16.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.3, %.lr.ph16.us.new ], [ %indvars.iv70.unr, %.lr.ph16.us.new.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv70
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.1
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.1
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.2
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.2
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next71.3 = add nsw i64 %indvars.iv70, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next71.3, %wide.trip.count68
  br i1 %exitcond73.3, label %._crit_edge17.us.loopexit, label %.lr.ph16.us.new

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.prol.loopexit83
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph20.split.us, %._crit_edge.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge.us.us ], [ 0, %.lr.ph20.split.us ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv66
  store double 0.000000e+00, double* %46, align 8
  br i1 %lcmp.mod93, label %._crit_edge88.prol.loopexit.unr-lcssa, label %._crit_edge88.prol.preheader

._crit_edge88.prol.preheader:                     ; preds = %.lr.ph.us.us
  %47 = load double, double* %20, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv66
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, 0.000000e+00
  store double %51, double* %46, align 8
  br label %._crit_edge88.prol.loopexit.unr-lcssa

._crit_edge88.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge88.prol.preheader
  %.unr.ph = phi double [ %51, %._crit_edge88.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv64.unr.ph = phi i64 [ 1, %._crit_edge88.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge88.prol.loopexit.unr-lcssa
  br label %._crit_edge88

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge88
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge88.prol.loopexit.unr-lcssa, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge9.us.loopexit, label %.lr.ph.us.us

._crit_edge88:                                    ; preds = %._crit_edge88, %.lr.ph.us.us.new
  %52 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %64, %._crit_edge88 ]
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next65.1, %._crit_edge88 ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv64
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv66
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %57, %52
  store double %58, double* %46, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next65
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next65, i64 %indvars.iv66
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %63, %58
  store double %64, double* %46, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next65.1, %11
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge88

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next57.7, %.lr.ph20.split ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond59.7 = icmp eq i64 %indvars.iv.next57.7, %wide.trip.count76
  br i1 %exitcond59.7, label %._crit_edge21.loopexit90.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit90.unr-lcssa:               ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit90

._crit_edge21.loopexit90:                         ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit90.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit90, %._crit_edge21.loopexit, %._crit_edge21._crit_edge
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next79, %12
  br i1 %exitcond91, label %._crit_edge.loopexit, label %._crit_edge21._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
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
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph26:
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph26
  %indvars.iv61 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next62, %._crit_edge20.us ]
  br label %.lr.ph15.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next62, 150
  br i1 %exitcond70, label %.lr.ph7.split.us.preheader, label %.lr.ph26.split.us

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge20.us
  br label %.lr.ph7.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph26.split.us, %._crit_edge16.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge16.us.us ], [ 0, %.lr.ph26.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  br label %._crit_edge66

._crit_edge16.us.us:                              ; preds = %._crit_edge66
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond60, label %._crit_edge20.us, label %.lr.ph15.us.us

._crit_edge66:                                    ; preds = %._crit_edge66, %.lr.ph15.us.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next54.1, %._crit_edge66 ]
  %6 = add nuw nsw i64 %5, %indvars.iv53
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next54
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, 160
  br i1 %exitcond56.1, label %._crit_edge16.us.us, label %._crit_edge66

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %._crit_edge68 ]
  %19 = mul nuw nsw i64 %indvars.iv50, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv50, %indvars.iv.next
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge68

._crit_edge.us:                                   ; preds = %._crit_edge68
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond69, label %._crit_edge67, label %.lr.ph7.split.us

._crit_edge67:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.split.us
  %indvars.iv35 = phi i64 [ 0, %.lr.ph12.split.us ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge43

._crit_edge.us.us:                                ; preds = %._crit_edge42
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.lr.ph.us.us

._crit_edge43:                                    ; preds = %._crit_edge42, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge42 ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge42

; <label>:15:                                     ; preds = %._crit_edge43
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge43, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge.us.us, label %._crit_edge43

._crit_edge:                                      ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
