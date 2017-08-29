; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %6 to double*
  tail call void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %5 to double*
  tail call void @print_array(i32 2000, double* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*, double*) #0 {
.lr.ph39:
  %5 = alloca [2000 x double]*, align 8
  %6 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %5, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph39
  %indvars.iv139 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next140.1, %._crit_edge ]
  %sext = shl i64 %indvars.iv139, 32
  %7 = ashr exact i64 %sext, 32
  %8 = getelementptr inbounds double, double* %3, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  %10 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %11 = bitcast double* %10 to <2 x double>*
  %indvars.iv.next140 = or i64 %indvars.iv139, 1
  %12 = trunc i64 %indvars.iv.next140 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %15 = trunc i64 %indvars.iv.next140.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %13, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double 2.000000e+03>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fadd <2 x double> %20, <double 4.000000e+00, double 4.000000e+00>
  %22 = bitcast double* %14 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8
  %exitcond155.1 = icmp eq i64 %indvars.iv.next140.1, 2000
  br i1 %exitcond155.1, label %.preheader15.preheader, label %._crit_edge

.preheader15.preheader:                           ; preds = %._crit_edge
  br label %.preheader15

.preheader15:                                     ; preds = %.loopexit44..preheader15_crit_edge, %.preheader15.preheader
  %23 = phi [2000 x double]* [ %29, %.loopexit44..preheader15_crit_edge ], [ %1, %.preheader15.preheader ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %.loopexit44..preheader15_crit_edge ], [ 0, %.preheader15.preheader ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %.loopexit44..preheader15_crit_edge ], [ 1, %.preheader15.preheader ]
  %indvars.iv127 = phi i32 [ %indvars.iv.next128, %.loopexit44..preheader15_crit_edge ], [ 0, %.preheader15.preheader ]
  %sext204 = shl i64 %indvars.iv131, 32
  %24 = ashr exact i64 %sext204, 32
  %25 = icmp slt i64 %indvars.iv137, 0
  br i1 %25, label %.preheader14, label %.lr.ph29.preheader

.lr.ph29.preheader:                               ; preds = %.preheader15
  %wide.trip.count129 = zext i32 %indvars.iv127 to i64
  br label %.lr.ph29

.preheader14:                                     ; preds = %..preheader14_crit_edge, %.preheader15
  %26 = phi [2000 x double]* [ %.pre, %..preheader14_crit_edge ], [ %23, %.preheader15 ]
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %27 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %27, label %.lr.ph32, label %.loopexit44.thread

.loopexit44.thread:                               ; preds = %.preheader14
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %28, align 8
  br label %.preheader16._crit_edge

.lr.ph32:                                         ; preds = %.preheader14
  %29 = load [2000 x double]*, [2000 x double]** %5, align 8
  %30 = sub nsw i64 1999, %24
  %31 = sub nsw i64 0, %24
  %xtraiter = and i64 %31, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph32
  br label %32

; <label>:32:                                     ; preds = %32, %.prol.preheader
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %32 ], [ %24, %.prol.preheader ]
  %33 = phi [2000 x double]* [ %29, %32 ], [ %26, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %32 ], [ %xtraiter, %.prol.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv137, i64 %indvars.iv133.prol
  store double 0.000000e+00, double* %34, align 8
  %indvars.iv.next134.prol = add nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %32, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %32
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa, %.lr.ph32
  %indvars.iv133.unr = phi i64 [ %24, %.lr.ph32 ], [ %indvars.iv.next134.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %26, %.lr.ph32 ], [ %29, %.prol.loopexit.unr-lcssa ]
  %35 = icmp ult i64 %30, 7
  br i1 %35, label %.loopexit44, label %.lr.ph32.new

.lr.ph32.new:                                     ; preds = %.prol.loopexit
  br label %43

.lr.ph29:                                         ; preds = %.lr.ph29, %.lr.ph29.preheader
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %.lr.ph29 ], [ 0, %.lr.ph29.preheader ]
  %36 = sub nsw i64 0, %indvars.iv125
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 2.000000e+03
  %41 = fadd double %40, 1.000000e+00
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv137, i64 %indvars.iv125
  store double %41, double* %42, align 8
  %exitcond130 = icmp eq i64 %indvars.iv125, %wide.trip.count129
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  br i1 %exitcond130, label %..preheader14_crit_edge, label %.lr.ph29

..preheader14_crit_edge:                          ; preds = %.lr.ph29
  %.pre = load [2000 x double]*, [2000 x double]** %5, align 8
  br label %.preheader14

; <label>:43:                                     ; preds = %43, %.lr.ph32.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr, %.lr.ph32.new ], [ %indvars.iv.next134.7, %43 ]
  %44 = phi [2000 x double]* [ %.unr, %.lr.ph32.new ], [ %29, %43 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %indvars.iv137, i64 %indvars.iv133
  store double 0.000000e+00, double* %45, align 8
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134
  store double 0.000000e+00, double* %46, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.1
  store double 0.000000e+00, double* %47, align 8
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.2
  store double 0.000000e+00, double* %48, align 8
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.3
  store double 0.000000e+00, double* %49, align 8
  %indvars.iv.next134.4 = add nsw i64 %indvars.iv133, 5
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.4
  store double 0.000000e+00, double* %50, align 8
  %indvars.iv.next134.5 = add nsw i64 %indvars.iv133, 6
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.5
  store double 0.000000e+00, double* %51, align 8
  %indvars.iv.next134.6 = add nsw i64 %indvars.iv133, 7
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv.next134.6
  store double 0.000000e+00, double* %52, align 8
  %exitcond136.7 = icmp eq i64 %indvars.iv.next134.6, 1999
  %indvars.iv.next134.7 = add nsw i64 %indvars.iv133, 8
  br i1 %exitcond136.7, label %.loopexit44.unr-lcssa, label %43

.loopexit44.unr-lcssa:                            ; preds = %43
  br label %.loopexit44

.loopexit44:                                      ; preds = %.loopexit44.unr-lcssa, %.prol.loopexit
  %53 = icmp slt i64 %indvars.iv.next138, 2000
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %54, align 8
  br i1 %53, label %.loopexit44..preheader15_crit_edge, label %.preheader16._crit_edge.loopexit

.loopexit44..preheader15_crit_edge:               ; preds = %.loopexit44
  %indvars.iv.next128 = add i32 %indvars.iv127, 1
  %indvars.iv.next132 = add nsw i64 %24, 1
  br label %.preheader15

.preheader16._crit_edge.loopexit:                 ; preds = %.loopexit44
  br label %.preheader16._crit_edge

.preheader16._crit_edge:                          ; preds = %.preheader16._crit_edge.loopexit, %.loopexit44.thread
  %55 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %56 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %55, i8** %56, align 8
  %57 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %58 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %59 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %60 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %61 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %62 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %63 = bitcast i8* %55 to [2000 x [2000 x double]]*
  %64 = bitcast i8* %55 to [2000 x [2000 x double]]*
  br label %.loopexit43.us

.loopexit43.us:                                   ; preds = %.loopexit43.us, %.preheader16._crit_edge
  %indvars.iv122 = phi i64 [ 0, %.preheader16._crit_edge ], [ %indvars.iv.next123.7, %.loopexit43.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv122, i64 0
  %scevgep145 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123 = or i64 %indvars.iv122, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv.next123, i64 0
  %scevgep145.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.1 = or i64 %indvars.iv122, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv.next123.1, i64 0
  %scevgep145.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.2 = or i64 %indvars.iv122, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv.next123.2, i64 0
  %scevgep145.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.3 = or i64 %indvars.iv122, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %61, i64 0, i64 %indvars.iv.next123.3, i64 0
  %scevgep145.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.4 = or i64 %indvars.iv122, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv.next123.4, i64 0
  %scevgep145.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.5 = or i64 %indvars.iv122, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv.next123.5, i64 0
  %scevgep145.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.6 = or i64 %indvars.iv122, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv.next123.6, i64 0
  %scevgep145.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep145.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.7 = add nsw i64 %indvars.iv122, 8
  %exitcond154.7 = icmp eq i64 %indvars.iv.next123.7, 2000
  br i1 %exitcond154.7, label %.preheader11.lr.ph..preheader11.us_crit_edge, label %.loopexit43.us

.preheader11.lr.ph..preheader11.us_crit_edge:     ; preds = %.loopexit43.us
  %65 = load [2000 x double]*, [2000 x double]** %5, align 8
  %66 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  br label %.preheader10.lr.ph.us

.preheader10.lr.ph.us:                            ; preds = %.loopexit42.us-lcssa.us.us, %.preheader11.lr.ph..preheader11.us_crit_edge
  %indvars.iv115 = phi i64 [ 0, %.preheader11.lr.ph..preheader11.us_crit_edge ], [ %indvars.iv.next116, %.loopexit42.us-lcssa.us.us ]
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %65, i64 0, i64 %indvars.iv115
  %67 = add nuw nsw i64 %indvars.iv115, 1
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %65, i64 1999, i64 %67
  br label %.preheader10.us.us

.loopexit42.us-lcssa.us.us:                       ; preds = %.loopexit41.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond153, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader10.lr.ph.us

.preheader10.us.us:                               ; preds = %.loopexit41.us.us, %.preheader10.lr.ph.us
  %indvars.iv113 = phi i64 [ 0, %.preheader10.lr.ph.us ], [ %indvars.iv.next114, %.loopexit41.us.us ]
  %scevgep161 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv113, i64 0
  %68 = add nuw nsw i64 %indvars.iv113, 1
  %scevgep163 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %68, i64 0
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult double* %scevgep161, %scevgep167
  %bound1 = icmp ult double* %scevgep165, %scevgep163
  %found.conflict = and i1 %bound0, %bound1
  %bound0170 = icmp ult double* %scevgep161, %69
  %bound1171 = icmp ult double* %69, %scevgep163
  %found.conflict172 = and i1 %bound0170, %bound1171
  %conflict.rdx = or i1 %found.conflict, %found.conflict172
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader10.us.us
  %70 = load double, double* %69, align 8, !alias.scope !3
  %71 = insertelement <2 x double> undef, double %70, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = insertelement <2 x double> undef, double %70, i32 0
  %74 = shufflevector <2 x double> %73, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader10.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %75 = or i64 %index, 1
  %76 = or i64 %index, 2
  %77 = or i64 %index, 3
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %index, i64 %indvars.iv115
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %75, i64 %indvars.iv115
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %76, i64 %indvars.iv115
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %77, i64 %indvars.iv115
  %82 = load double, double* %78, align 8, !alias.scope !6
  %83 = load double, double* %79, align 8, !alias.scope !6
  %84 = load double, double* %80, align 8, !alias.scope !6
  %85 = load double, double* %81, align 8, !alias.scope !6
  %86 = insertelement <2 x double> undef, double %82, i32 0
  %87 = insertelement <2 x double> %86, double %83, i32 1
  %88 = insertelement <2 x double> undef, double %84, i32 0
  %89 = insertelement <2 x double> %88, double %85, i32 1
  %90 = fmul <2 x double> %72, %87
  %91 = fmul <2 x double> %74, %89
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv113, i64 %index
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !8, !noalias !10
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load174 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !8, !noalias !10
  %96 = fadd <2 x double> %90, %wide.load
  %97 = fadd <2 x double> %91, %wide.load174
  %98 = bitcast double* %92 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !8, !noalias !10
  %99 = bitcast double* %94 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %100 = icmp eq i64 %index.next, 2000
  br i1 %100, label %.loopexit41.us.us.loopexit206, label %vector.body, !llvm.loop !11

.loopexit41.us.us.loopexit:                       ; preds = %scalar.ph
  br label %.loopexit41.us.us

.loopexit41.us.us.loopexit206:                    ; preds = %vector.body
  br label %.loopexit41.us.us

.loopexit41.us.us:                                ; preds = %.loopexit41.us.us.loopexit206, %.loopexit41.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond152, label %.loopexit42.us-lcssa.us.us, label %.preheader10.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv109 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next110.1, %scalar.ph ]
  %101 = load double, double* %69, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv109, i64 %indvars.iv115
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  store double %107, double* %105, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %108 = load double, double* %69, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv.next110, i64 %indvars.iv115
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  store double %114, double* %112, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110, 1999
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  br i1 %exitcond112.1, label %.loopexit41.us.us.loopexit, label %scalar.ph, !llvm.loop !14

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.loopexit42.us-lcssa.us.us
  %115 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  %116 = load [2000 x double]*, [2000 x double]** %5, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv107 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next108, %.loopexit.us ]
  %scevgep180 = getelementptr [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 0
  %117 = add nuw nsw i64 %indvars.iv107, 1
  %scevgep182 = getelementptr [2000 x double], [2000 x double]* %116, i64 %117, i64 0
  %scevgep184 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 0
  %scevgep186 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %117, i64 0
  %bound0188 = icmp ult double* %scevgep180, %scevgep186
  %bound1189 = icmp ult double* %scevgep184, %scevgep182
  %memcheck.conflict191 = and i1 %bound0188, %bound1189
  br i1 %memcheck.conflict191, label %scalar.ph177.preheader, label %vector.body175.preheader

vector.body175.preheader:                         ; preds = %.preheader.us
  br label %vector.body175

scalar.ph177.preheader:                           ; preds = %.preheader.us
  br label %scalar.ph177

vector.body175:                                   ; preds = %vector.body175, %vector.body175.preheader
  %index194 = phi i64 [ 0, %vector.body175.preheader ], [ %index.next195.1, %vector.body175 ]
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %index194
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !15
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load203 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !15
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %index194
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load202, <2 x i64>* %123, align 8, !alias.scope !18, !noalias !15
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load203, <2 x i64>* %125, align 8, !alias.scope !18, !noalias !15
  %index.next195 = or i64 %index194, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %index.next195
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load202.1 = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !15
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  %wide.load203.1 = load <2 x i64>, <2 x i64>* %129, align 8, !alias.scope !15
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %index.next195
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load202.1, <2 x i64>* %131, align 8, !alias.scope !18, !noalias !15
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x i64>*
  store <2 x i64> %wide.load203.1, <2 x i64>* %133, align 8, !alias.scope !18, !noalias !15
  %index.next195.1 = add nsw i64 %index194, 8
  %134 = icmp eq i64 %index.next195.1, 2000
  br i1 %134, label %.loopexit.us.loopexit205, label %vector.body175, !llvm.loop !20

scalar.ph177:                                     ; preds = %scalar.ph177, %scalar.ph177.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph177.preheader ], [ %indvars.iv.next.4, %scalar.ph177 ]
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %indvars.iv
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %indvars.iv.next
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %150 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %151 = bitcast double* %150 to i64*
  %152 = load i64, i64* %151, align 8
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %154 = bitcast double* %153 to i64*
  store i64 %152, i64* %154, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %155 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %156 = bitcast double* %155 to i64*
  %157 = load i64, i64* %156, align 8
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %116, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %159 = bitcast double* %158 to i64*
  store i64 %157, i64* %159, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %.loopexit.us.loopexit, label %scalar.ph177, !llvm.loop !21

.loopexit.us.loopexit:                            ; preds = %scalar.ph177
  br label %.loopexit.us

.loopexit.us.loopexit205:                         ; preds = %vector.body175
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit205, %.loopexit.us.loopexit
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond151, label %.loopexit40.loopexit, label %.preheader.us

.loopexit40.loopexit:                             ; preds = %.loopexit.us
  %160 = bitcast [2000 x [2000 x double]]* %115 to i8*
  tail call void @free(i8* %160) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) #2 {
.preheader11.lr.ph:
  br label %.preheader11

.preheader11:                                     ; preds = %.loopexit47, %.preheader11.lr.ph
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %.loopexit47 ], [ 0, %.preheader11.lr.ph ]
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %.loopexit47 ], [ 4294967295, %.preheader11.lr.ph ]
  %5 = sub i64 1999, %indvars.iv166
  %6 = and i64 %indvars.iv138, 4294967295
  %7 = icmp sgt i64 %indvars.iv166, 0
  br i1 %7, label %.lr.ph33.preheader, label %.lr.ph41

.lr.ph33.preheader:                               ; preds = %.preheader11
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 0
  br label %.lr.ph33

.lr.ph41.loopexit:                                ; preds = %._crit_edge92
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.loopexit, %.preheader11
  %9 = icmp sgt i64 %indvars.iv166, 0
  br i1 %9, label %.lr.ph41.split.us.preheader, label %.lr.ph41.split.preheader

.lr.ph41.split.preheader:                         ; preds = %.lr.ph41
  %10 = sub i64 0, %indvars.iv166
  %xtraiter189 = and i64 %10, 7
  %lcmp.mod190 = icmp eq i64 %xtraiter189, 0
  br i1 %lcmp.mod190, label %.lr.ph41.split.prol.loopexit, label %.lr.ph41.split.prol.preheader

.lr.ph41.split.prol.preheader:                    ; preds = %.lr.ph41.split.preheader
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol:                              ; preds = %.lr.ph41.split.prol, %.lr.ph41.split.prol.preheader
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.lr.ph41.split.prol ], [ %indvars.iv166, %.lr.ph41.split.prol.preheader ]
  %prol.iter191 = phi i64 [ %prol.iter191.sub, %.lr.ph41.split.prol ], [ %xtraiter189, %.lr.ph41.split.prol.preheader ]
  %indvars.iv.next133.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter191.sub = add i64 %prol.iter191, -1
  %prol.iter191.cmp = icmp eq i64 %prol.iter191.sub, 0
  br i1 %prol.iter191.cmp, label %.lr.ph41.split.prol.loopexit.unr-lcssa, label %.lr.ph41.split.prol, !llvm.loop !22

.lr.ph41.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph41.split.prol
  br label %.lr.ph41.split.prol.loopexit

.lr.ph41.split.prol.loopexit:                     ; preds = %.lr.ph41.split.prol.loopexit.unr-lcssa, %.lr.ph41.split.preheader
  %indvars.iv132.unr = phi i64 [ %indvars.iv166, %.lr.ph41.split.preheader ], [ %indvars.iv.next133.prol, %.lr.ph41.split.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %5, 7
  br i1 %11, label %.loopexit47.loopexit178, label %.lr.ph41.split.preheader.new

.lr.ph41.split.preheader.new:                     ; preds = %.lr.ph41.split.prol.loopexit
  br label %.lr.ph41.split

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %12 = and i64 %indvars.iv138, 1
  %lcmp.mod195 = icmp eq i64 %12, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 0
  %14 = icmp eq i64 %6, 0
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %.loopexit45.us, %.lr.ph41.split.us.preheader
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %.loopexit45.us ], [ %indvars.iv166, %.lr.ph41.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv144
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod195, label %.prol.preheader192, label %.prol.loopexit193.unr-lcssa

.prol.preheader192:                               ; preds = %.lr.ph41.split.us
  br label %17

; <label>:17:                                     ; preds = %.prol.preheader192
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv144
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  br label %.prol.loopexit193.unr-lcssa

.prol.loopexit193.unr-lcssa:                      ; preds = %17, %.lr.ph41.split.us
  %.lcssa181.unr.ph = phi double [ %22, %17 ], [ undef, %.lr.ph41.split.us ]
  %indvars.iv136.unr.ph = phi i64 [ 1, %17 ], [ 0, %.lr.ph41.split.us ]
  %.unr196.ph = phi double [ %22, %17 ], [ %16, %.lr.ph41.split.us ]
  br label %.prol.loopexit193

.prol.loopexit193:                                ; preds = %.prol.loopexit193.unr-lcssa
  br i1 %14, label %.loopexit45.us, label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.prol.loopexit193
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph41.split.us.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr.ph, %.lr.ph41.split.us.new ], [ %indvars.iv.next137.1, %23 ]
  %24 = phi double [ %.unr196.ph, %.lr.ph41.split.us.new ], [ %38, %23 ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv136
  %26 = bitcast double* %25 to <2 x double>*
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv144
  %28 = load double, double* %27, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %29 = load <2 x double>, <2 x double>* %26, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next137, i64 %indvars.iv144
  %31 = load double, double* %30, align 8
  %32 = insertelement <2 x double> undef, double %28, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fmul <2 x double> %29, %33
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  %37 = fsub double %24, %35
  %38 = fsub double %37, %36
  %exitcond141.1 = icmp eq i64 %indvars.iv.next137, %6
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  br i1 %exitcond141.1, label %.loopexit45.us.unr-lcssa, label %23

.loopexit45.us.unr-lcssa:                         ; preds = %23
  br label %.loopexit45.us

.loopexit45.us:                                   ; preds = %.loopexit45.us.unr-lcssa, %.prol.loopexit193
  %.lcssa181 = phi double [ %.lcssa181.unr.ph, %.prol.loopexit193 ], [ %38, %.loopexit45.us.unr-lcssa ]
  store double %.lcssa181, double* %15, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next145, 2000
  br i1 %exitcond160, label %.loopexit47.loopexit, label %.lr.ph41.split.us

.lr.ph33:                                         ; preds = %._crit_edge92, %.lr.ph33.preheader
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %._crit_edge92 ], [ 0, %.lr.ph33.preheader ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge92 ], [ 4294967295, %.lr.ph33.preheader ]
  %39 = and i64 %indvars.iv124, 4294967295
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv128
  %41 = load double, double* %40, align 8
  %42 = icmp sgt i64 %indvars.iv128, 0
  br i1 %42, label %.lr.ph29.preheader, label %._crit_edge92

.lr.ph29.preheader:                               ; preds = %.lr.ph33
  %43 = and i64 %indvars.iv124, 1
  %lcmp.mod187 = icmp eq i64 %43, 0
  br i1 %lcmp.mod187, label %.lr.ph29.prol.preheader, label %.lr.ph29.prol.loopexit.unr-lcssa

.lr.ph29.prol.preheader:                          ; preds = %.lr.ph29.preheader
  br label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.prol.preheader
  %44 = load double, double* %8, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv128
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %41, %47
  br label %.lr.ph29.prol.loopexit.unr-lcssa

.lr.ph29.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph29.prol, %.lr.ph29.preheader
  %.lcssa180.unr.ph = phi double [ %48, %.lr.ph29.prol ], [ undef, %.lr.ph29.preheader ]
  %indvars.iv122.unr.ph = phi i64 [ 1, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  %.unr188.ph = phi double [ %48, %.lr.ph29.prol ], [ %41, %.lr.ph29.preheader ]
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.prol.loopexit.unr-lcssa
  %49 = icmp eq i64 %39, 0
  br i1 %49, label %._crit_edge92.loopexit, label %.lr.ph29.preheader.new

.lr.ph29.preheader.new:                           ; preds = %.lr.ph29.prol.loopexit
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29, %.lr.ph29.preheader.new
  %indvars.iv122 = phi i64 [ %indvars.iv122.unr.ph, %.lr.ph29.preheader.new ], [ %indvars.iv.next123.1, %.lr.ph29 ]
  %50 = phi double [ %.unr188.ph, %.lr.ph29.preheader.new ], [ %64, %.lr.ph29 ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv122
  %52 = bitcast double* %51 to <2 x double>*
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv128
  %54 = load double, double* %53, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next123, i64 %indvars.iv128
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %55, %59
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %50, %61
  %64 = fsub double %63, %62
  %exitcond127.1 = icmp eq i64 %indvars.iv.next123, %39
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, 2
  br i1 %exitcond127.1, label %._crit_edge92.loopexit.unr-lcssa, label %.lr.ph29

._crit_edge92.loopexit.unr-lcssa:                 ; preds = %.lr.ph29
  br label %._crit_edge92.loopexit

._crit_edge92.loopexit:                           ; preds = %._crit_edge92.loopexit.unr-lcssa, %.lr.ph29.prol.loopexit
  %.lcssa180 = phi double [ %.lcssa180.unr.ph, %.lr.ph29.prol.loopexit ], [ %64, %._crit_edge92.loopexit.unr-lcssa ]
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %.lr.ph33
  %65 = phi double [ %41, %.lr.ph33 ], [ %.lcssa180, %._crit_edge92.loopexit ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv128
  %67 = load double, double* %66, align 8
  %68 = fdiv double %65, %67
  store double %68, double* %40, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %indvars.iv.next125 = add nuw nsw i64 %39, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next129, %indvars.iv166
  br i1 %exitcond168, label %.lr.ph41.loopexit, label %.lr.ph33

.lr.ph41.split:                                   ; preds = %.lr.ph41.split, %.lr.ph41.split.preheader.new
  %indvars.iv132 = phi i64 [ %indvars.iv132.unr, %.lr.ph41.split.preheader.new ], [ %indvars.iv.next133.7, %.lr.ph41.split ]
  %exitcond135.7 = icmp eq i64 %indvars.iv132, 1992
  %indvars.iv.next133.7 = add nsw i64 %indvars.iv132, 8
  br i1 %exitcond135.7, label %.loopexit47.loopexit178.unr-lcssa, label %.lr.ph41.split

.loopexit47.loopexit:                             ; preds = %.loopexit45.us
  br label %.loopexit47

.loopexit47.loopexit178.unr-lcssa:                ; preds = %.lr.ph41.split
  br label %.loopexit47.loopexit178

.loopexit47.loopexit178:                          ; preds = %.loopexit47.loopexit178.unr-lcssa, %.lr.ph41.split.prol.loopexit
  br label %.loopexit47

.loopexit47:                                      ; preds = %.loopexit47.loopexit178, %.loopexit47.loopexit
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %indvars.iv.next139 = add nuw nsw i64 %6, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next167, 2000
  br i1 %exitcond169, label %.lr.ph25.preheader, label %.preheader11

.lr.ph25.preheader:                               ; preds = %.loopexit47
  br label %.lr.ph25

.lr.ph25:                                         ; preds = %._crit_edge95, %.lr.ph25.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge95 ], [ 0, %.lr.ph25.preheader ]
  %indvars.iv116 = phi i32 [ %indvars.iv.next117, %._crit_edge95 ], [ -1, %.lr.ph25.preheader ]
  %69 = add i64 %indvars.iv120, 4294967295
  %70 = and i64 %69, 4294967295
  %sext = shl i64 %indvars.iv120, 32
  %71 = ashr exact i64 %sext, 32
  %72 = getelementptr inbounds double, double* %2, i64 %71
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = icmp sgt i64 %indvars.iv120, 0
  br i1 %75, label %.lr.ph22, label %._crit_edge95

.lr.ph22:                                         ; preds = %.lr.ph25
  %76 = bitcast i64 %74 to double
  %wide.trip.count118 = zext i32 %indvars.iv116 to i64
  %xtraiter182 = and i64 %indvars.iv120, 3
  %lcmp.mod183 = icmp eq i64 %xtraiter182, 0
  br i1 %lcmp.mod183, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph22
  br label %77

; <label>:77:                                     ; preds = %77, %.prol.preheader
  %indvars.iv114.prol = phi i64 [ %indvars.iv.next115.prol, %77 ], [ 0, %.prol.preheader ]
  %78 = phi double [ %84, %77 ], [ %76, %.prol.preheader ]
  %prol.iter184 = phi i64 [ %prol.iter184.sub, %77 ], [ %xtraiter182, %.prol.preheader ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv114.prol
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv114.prol
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fsub double %78, %83
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.prol, 1
  %prol.iter184.sub = add i64 %prol.iter184, -1
  %prol.iter184.cmp = icmp eq i64 %prol.iter184.sub, 0
  br i1 %prol.iter184.cmp, label %.prol.loopexit.unr-lcssa, label %77, !llvm.loop !23

.prol.loopexit.unr-lcssa:                         ; preds = %77
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa, %.lr.ph22
  %.lcssa179.unr = phi double [ undef, %.lr.ph22 ], [ %84, %.prol.loopexit.unr-lcssa ]
  %indvars.iv114.unr = phi i64 [ 0, %.lr.ph22 ], [ %indvars.iv.next115.prol, %.prol.loopexit.unr-lcssa ]
  %.unr185 = phi double [ %76, %.lr.ph22 ], [ %84, %.prol.loopexit.unr-lcssa ]
  %85 = icmp ult i64 %70, 3
  br i1 %85, label %.loopexit44, label %.lr.ph22.new

.lr.ph22.new:                                     ; preds = %.prol.loopexit
  br label %86

; <label>:86:                                     ; preds = %86, %.lr.ph22.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr, %.lr.ph22.new ], [ %indvars.iv.next115.3, %86 ]
  %87 = phi double [ %.unr185, %.lr.ph22.new ], [ %109, %86 ]
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv114
  %89 = bitcast double* %88 to <2 x double>*
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv114
  %91 = bitcast double* %90 to <2 x double>*
  %92 = load <2 x double>, <2 x double>* %89, align 8
  %93 = load <2 x double>, <2 x double>* %91, align 8
  %94 = fmul <2 x double> %92, %93
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fsub double %87, %95
  %98 = fsub double %97, %96
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next115.1
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next115.1
  %102 = bitcast double* %101 to <2 x double>*
  %indvars.iv.next115.2 = add nsw i64 %indvars.iv114, 3
  %103 = load <2 x double>, <2 x double>* %100, align 8
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = fmul <2 x double> %103, %104
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fsub double %98, %106
  %109 = fsub double %108, %107
  %exitcond119.3 = icmp eq i64 %indvars.iv.next115.2, %wide.trip.count118
  %indvars.iv.next115.3 = add nsw i64 %indvars.iv114, 4
  br i1 %exitcond119.3, label %.loopexit44.unr-lcssa, label %86

.loopexit44.unr-lcssa:                            ; preds = %86
  br label %.loopexit44

.loopexit44:                                      ; preds = %.loopexit44.unr-lcssa, %.prol.loopexit
  %.lcssa179 = phi double [ %.lcssa179.unr, %.prol.loopexit ], [ %109, %.loopexit44.unr-lcssa ]
  %110 = bitcast double %.lcssa179 to i64
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %.loopexit44, %.lr.ph25
  %111 = phi i64 [ %110, %.loopexit44 ], [ %74, %.lr.ph25 ]
  %112 = getelementptr inbounds double, double* %4, i64 %indvars.iv120
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %indvars.iv.next117 = add nsw i32 %indvars.iv116, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond165, label %.lr.ph18.preheader, label %.lr.ph25

.lr.ph18.preheader:                               ; preds = %._crit_edge95
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge98, %.lr.ph18.preheader
  %indvar = phi i64 [ 0, %.lr.ph18.preheader ], [ %indvar.next, %._crit_edge98 ]
  %indvars.iv176 = phi i64 [ 1999, %.lr.ph18.preheader ], [ %indvars.iv.next177, %._crit_edge98 ]
  %indvars.iv174 = phi i64 [ 2000, %.lr.ph18.preheader ], [ %indvars.iv.next175, %._crit_edge98 ]
  %114 = add i64 %indvar, -1
  %115 = getelementptr inbounds double, double* %4, i64 %indvars.iv176
  %116 = load double, double* %115, align 8
  %117 = add nuw nsw i64 %indvars.iv176, 1
  %118 = icmp slt i64 %117, 2000
  br i1 %118, label %.lr.ph.preheader, label %._crit_edge98

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %.lr.ph.prol ], [ %indvars.iv174, %.lr.ph.prol.preheader ]
  %119 = phi double [ %125, %.lr.ph.prol ], [ %116, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv109.prol
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %3, i64 %indvars.iv109.prol
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fsub double %119, %124
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !24

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa, %.lr.ph.preheader
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %125, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv109.unr = phi i64 [ %indvars.iv174, %.lr.ph.preheader ], [ %indvars.iv.next110.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %116, %.lr.ph.preheader ], [ %125, %.lr.ph.prol.loopexit.unr-lcssa ]
  %126 = icmp ult i64 %114, 3
  br i1 %126, label %._crit_edge98.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next110.3, %.lr.ph ]
  %127 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %149, %.lr.ph ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv109
  %129 = bitcast double* %128 to <2 x double>*
  %130 = getelementptr inbounds double, double* %3, i64 %indvars.iv109
  %131 = bitcast double* %130 to <2 x double>*
  %132 = load <2 x double>, <2 x double>* %129, align 8
  %133 = load <2 x double>, <2 x double>* %131, align 8
  %134 = fmul <2 x double> %132, %133
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fsub double %127, %135
  %138 = fsub double %137, %136
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv.next110.1
  %140 = bitcast double* %139 to <2 x double>*
  %141 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next110.1
  %142 = bitcast double* %141 to <2 x double>*
  %indvars.iv.next110.2 = add nsw i64 %indvars.iv109, 3
  %143 = load <2 x double>, <2 x double>* %140, align 8
  %144 = load <2 x double>, <2 x double>* %142, align 8
  %145 = fmul <2 x double> %143, %144
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fsub double %138, %146
  %149 = fsub double %148, %147
  %exitcond.3 = icmp eq i64 %indvars.iv.next110.2, 1999
  %indvars.iv.next110.3 = add nsw i64 %indvars.iv109, 4
  br i1 %exitcond.3, label %._crit_edge98.loopexit.unr-lcssa, label %.lr.ph

._crit_edge98.loopexit.unr-lcssa:                 ; preds = %.lr.ph
  br label %._crit_edge98.loopexit

._crit_edge98.loopexit:                           ; preds = %._crit_edge98.loopexit.unr-lcssa, %.lr.ph.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %149, %._crit_edge98.loopexit.unr-lcssa ]
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98.loopexit, %.lr.ph18
  %150 = phi double [ %116, %.lr.ph18 ], [ %.lcssa, %._crit_edge98.loopexit ]
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv176
  %152 = load double, double* %151, align 8
  %153 = fdiv double %150, %152
  %154 = getelementptr inbounds double, double* %3, i64 %indvars.iv176
  store double %153, double* %154, align 8
  %indvars.iv.next177 = add nsw i64 %indvars.iv176, -1
  %155 = icmp sgt i64 %indvars.iv176, 0
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, -1
  %indvar.next = add i64 %indvar, 1
  br i1 %155, label %.lr.ph18, label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %._crit_edge98
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %15, %._crit_edge2 ], [ 0, %.lr.ph ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
