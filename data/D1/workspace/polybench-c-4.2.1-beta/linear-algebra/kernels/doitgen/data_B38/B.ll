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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %xtraiter83 = and i32 %2, 1
  %wide.trip.count68 = zext i32 %2 to i64
  %xtraiter88 = and i32 %2, 3
  %wide.trip.count76 = zext i32 %1 to i64
  %10 = add nsw i32 %xtraiter88, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %wide.trip.count76, -1
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  %16 = icmp eq i32 %xtraiter83, 0
  %17 = icmp eq i32 %8, 0
  %18 = ptrtoint double* %5 to i64
  %19 = ptrtoint double* %5 to i64
  %20 = ptrtoint double* %5 to i64
  %21 = icmp eq i32 %xtraiter88, 0
  %22 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count76, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp ult i64 %13, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv78 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next79, %._crit_edge18 ]
  br i1 %14, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %15, label %.lr.ph.us.us.preheader.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.loopexit, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.loopexit:               ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.loopexit, %.preheader5.preheader
  %indvars.iv54.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next55.prol, %.preheader5.prol.loopexit.loopexit ]
  br i1 %23, label %._crit_edge18, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader5.lr.ph
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge16.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge16.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us.new
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %.prol.loopexit87
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge18.loopexit, label %.lr.ph.us.us.preheader

.lr.ph15.us.new:                                  ; preds = %.lr.ph15.us.new.preheader, %.lr.ph15.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.3, %.lr.ph15.us.new ], [ %indvars.iv70.unr, %.lr.ph15.us.new.preheader ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv70
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next71.2 = add nsw i64 %indvars.iv70, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next71.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next71.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next71.3 = add nsw i64 %indvars.iv70, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next71.3, %wide.trip.count68
  br i1 %exitcond73.3, label %._crit_edge16.us.loopexit, label %.lr.ph15.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next67, %._crit_edge.us.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv66
  store double 0.000000e+00, double* %45, align 8
  br i1 %16, label %.prol.loopexit82, label %.prol.preheader81

.prol.preheader81:                                ; preds = %.lr.ph.us.us
  %46 = load double, double* %24, align 8
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv66
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %sunkaddr46.prol = shl nsw i64 %indvars.iv66, 3
  %sunkaddr47.prol = add i64 %20, %sunkaddr46.prol
  %sunkaddr48.prol = inttoptr i64 %sunkaddr47.prol to double*
  %50 = load double, double* %sunkaddr48.prol, align 8
  %51 = fadd double %49, %50
  store double %51, double* %sunkaddr48.prol, align 8
  br label %.prol.loopexit82

.prol.loopexit82:                                 ; preds = %.lr.ph.us.us, %.prol.preheader81
  %indvars.iv62.unr.ph = phi i64 [ 1, %.prol.preheader81 ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit82
  %sunkaddr46 = shl nsw i64 %indvars.iv66, 3
  %sunkaddr47 = add i64 %18, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %.pre = load double, double* %sunkaddr48, align 8
  %sunkaddr93 = shl i64 %indvars.iv66, 3
  %sunkaddr94 = add i64 %19, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit82
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.lr.ph15.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %52 = phi double [ %.pre, %.lr.ph.us.us.new.preheader ], [ %64, %.lr.ph.us.us.new ]
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next63.1, %.lr.ph.us.us.new ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv62
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv66
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %57, %52
  store double %58, double* %sunkaddr95, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv.next63
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next63, i64 %indvars.iv66
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %63, %58
  store double %64, double* %sunkaddr95, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, %wide.trip.count68
  br i1 %exitcond65.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph15.us:                                      ; preds = %._crit_edge.us.us
  br i1 %21, label %.prol.loopexit87, label %.prol.preheader86.preheader

.prol.preheader86.preheader:                      ; preds = %.lr.ph15.us
  br label %.prol.preheader86

.prol.preheader86:                                ; preds = %.prol.preheader86.preheader, %.prol.preheader86
  %indvars.iv70.prol = phi i64 [ %indvars.iv.next71.prol, %.prol.preheader86 ], [ 0, %.prol.preheader86.preheader ]
  %prol.iter90 = phi i32 [ %prol.iter90.sub, %.prol.preheader86 ], [ %xtraiter88, %.prol.preheader86.preheader ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv70.prol
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv78, i64 %indvars.iv74, i64 %indvars.iv70.prol
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter90.sub = add nsw i32 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i32 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %.prol.loopexit87.loopexit, label %.prol.preheader86, !llvm.loop !3

.prol.loopexit87.loopexit:                        ; preds = %.prol.preheader86
  br label %.prol.loopexit87

.prol.loopexit87:                                 ; preds = %.prol.loopexit87.loopexit, %.lr.ph15.us
  %indvars.iv70.unr = phi i64 [ 0, %.lr.ph15.us ], [ %12, %.prol.loopexit87.loopexit ]
  br i1 %22, label %._crit_edge16.us, label %.lr.ph15.us.new.preheader

.lr.ph15.us.new.preheader:                        ; preds = %.prol.loopexit87
  br label %.lr.ph15.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %.preheader5.preheader.new ], [ %indvars.iv.next55.7, %.preheader5 ]
  %indvars.iv.next55.7 = add nsw i64 %indvars.iv54, 8
  %exitcond57.7 = icmp eq i64 %indvars.iv.next55.7, %wide.trip.count76
  br i1 %exitcond57.7, label %._crit_edge18.loopexit98, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit98:                         ; preds = %.preheader5
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit98, %._crit_edge18.loopexit, %.preheader5.prol.loopexit, %.preheader6
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond = icmp eq i64 %indvars.iv.next79, %9
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader6

._crit_edge.loopexit:                             ; preds = %._crit_edge18
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
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
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
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge19.us ]
  br label %.preheader6.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us, %.preheader7.us
  %indvars.iv55 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next56, %._crit_edge16.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv55, %indvars.iv59
  br label %._crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge19.us, label %.preheader6.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52.1, %._crit_edge ]
  %3 = add nuw nsw i64 %2, %indvars.iv51
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 160
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %8 = add nuw nsw i64 %2, %indvars.iv.next52
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.600000e+02, double 1.600000e+02>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge16.us.us, label %._crit_edge

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge64, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge64 ]
  %16 = mul nuw nsw i64 %indvars.iv48, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 160
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %21 = mul nuw nsw i64 %indvars.iv48, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.600000e+02, double 1.600000e+02>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge64

._crit_edge.us:                                   ; preds = %._crit_edge64
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond1, label %.loopexit, label %.preheader.us

.loopexit:                                        ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %5 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
  %indvars.iv33 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv33
  %7 = mul nuw nsw i64 %6, 160
  br label %._crit_edge41

._crit_edge.us.us:                                ; preds = %._crit_edge40
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge5.us, label %.preheader.us.us

._crit_edge41:                                    ; preds = %._crit_edge40, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge40 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge40

; <label>:12:                                     ; preds = %._crit_edge41
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge41, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %._crit_edge41

.loopexit:                                        ; preds = %._crit_edge5.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
