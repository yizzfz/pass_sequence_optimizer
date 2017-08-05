; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i8**, align 8
  %4 = alloca [2000 x double]*, align 8
  %5 = alloca [2000 x double]*, align 8
  store i8** %1, i8*** %3, align 8
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = bitcast [2000 x double]** %4 to i8**
  store i8* %6, i8** %7, align 8
  %8 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %9 = bitcast [2000 x double]** %5 to i8**
  store i8* %8, i8** %9, align 8
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %8 to double*
  br i1 true, label %.lr.ph19, label %.init_array.exit_crit_edge140

.init_array.exit_crit_edge140:                    ; preds = %2
  br label %init_array.exit

.lr.ph19:                                         ; preds = %2
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph19
  %indvars.iv38 = phi i64 [ 0, %.lr.ph19 ], [ %indvars.iv.next39.1, %._crit_edge ]
  %12 = trunc i64 %indvars.iv38 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %10, i64 %indvars.iv38
  %15 = insertelement <2 x double> undef, double %13, i32 0
  %16 = insertelement <2 x double> %15, double %13, i32 1
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 3.000000e+00>
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = bitcast double* %14 to <2 x double>*
  %20 = getelementptr inbounds double, double* %11, i64 %indvars.iv38
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %22 = trunc i64 %indvars.iv.next39 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fadd <2 x double> %25, <double 2.000000e+00, double 3.000000e+00>
  %27 = fdiv <2 x double> %26, <double 2.000000e+03, double 2.000000e+03>
  %28 = shufflevector <2 x double> %18, <2 x double> %27, <2 x i32> <i32 0, i32 2>
  store <2 x double> %28, <2 x double>* %19, align 8
  %29 = shufflevector <2 x double> %18, <2 x double> %27, <2 x i32> <i32 1, i32 3>
  store <2 x double> %29, <2 x double>* %21, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %30 = icmp slt i64 %indvars.iv.next39.1, 2000
  br i1 %30, label %._crit_edge, label %.init_array.exit_crit_edge

.init_array.exit_crit_edge:                       ; preds = %._crit_edge
  %.phi.trans.insert = bitcast [2000 x double]** %4 to i64*
  %.pre = load i64, i64* %.phi.trans.insert, align 8
  %.phi.trans.insert141 = bitcast [2000 x double]** %5 to i64*
  %.pre142 = load i64, i64* %.phi.trans.insert141, align 8
  %phitmp = bitcast [2000 x double]** %4 to double**
  br label %init_array.exit

init_array.exit:                                  ; preds = %.init_array.exit_crit_edge140, %.init_array.exit_crit_edge
  %.pre-phi = phi double** [ undef, %.init_array.exit_crit_edge140 ], [ %phitmp, %.init_array.exit_crit_edge ]
  %31 = phi i64 [ undef, %.init_array.exit_crit_edge140 ], [ %.pre142, %.init_array.exit_crit_edge ]
  %32 = phi i64 [ undef, %.init_array.exit_crit_edge140 ], [ %.pre, %.init_array.exit_crit_edge ]
  call void (...) @polybench_timer_start() #3
  %33 = inttoptr i64 %31 to double*
  %34 = inttoptr i64 %32 to double*
  br i1 true, label %.lr.ph7, label %init_array.exit.kernel_jacobi_1d.exit_crit_edge

init_array.exit.kernel_jacobi_1d.exit_crit_edge:  ; preds = %init_array.exit
  br label %kernel_jacobi_1d.exit

.lr.ph7:                                          ; preds = %init_array.exit
  br i1 true, label %.lr.ph7..lr.ph1.us_crit_edge, label %.lr.ph7.split

.lr.ph7..lr.ph1.us_crit_edge:                     ; preds = %.lr.ph7
  %scevgep72 = getelementptr double, double* %34, i64 1
  %scevgep74 = getelementptr double, double* %34, i64 1999
  %scevgep76 = getelementptr double, double* %33, i64 2000
  %scevgep110 = getelementptr double, double* %33, i64 1
  %scevgep113 = getelementptr double, double* %33, i64 1999
  %scevgep115 = getelementptr double, double* %34, i64 2000
  %bound078 = icmp ult double* %scevgep72, %scevgep76
  %bound179 = icmp ult double* %33, %scevgep74
  %memcheck.conflict81 = and i1 %bound078, %bound179
  %bound0117 = icmp ult double* %scevgep110, %scevgep115
  %bound1118 = icmp ult double* %34, %scevgep113
  %memcheck.conflict120 = and i1 %bound0117, %bound1118
  br label %.lr.ph1.us

.lr.ph1.us:                                       ; preds = %._crit_edge4.us, %.lr.ph7..lr.ph1.us_crit_edge
  %35 = phi i32 [ 0, %.lr.ph7..lr.ph1.us_crit_edge ], [ %60, %._crit_edge4.us ]
  br i1 false, label %.lr.ph1.us.._crit_edge23_crit_edge, label %min.iters.checked105

.lr.ph1.us.._crit_edge23_crit_edge:               ; preds = %.lr.ph1.us
  br label %._crit_edge23.preheader

min.iters.checked105:                             ; preds = %.lr.ph1.us
  br i1 false, label %min.iters.checked105.._crit_edge23_crit_edge, label %vector.memcheck121

min.iters.checked105.._crit_edge23_crit_edge:     ; preds = %min.iters.checked105
  br label %._crit_edge23.preheader

._crit_edge23.preheader:                          ; preds = %middle.block101, %vector.memcheck121, %.lr.ph1.us.._crit_edge23_crit_edge, %min.iters.checked105.._crit_edge23_crit_edge
  %indvars.iv.ph = phi i64 [ 1997, %middle.block101 ], [ 1, %vector.memcheck121 ], [ undef, %min.iters.checked105.._crit_edge23_crit_edge ], [ undef, %.lr.ph1.us.._crit_edge23_crit_edge ]
  br label %._crit_edge23

vector.memcheck121:                               ; preds = %min.iters.checked105
  br i1 %memcheck.conflict120, label %._crit_edge23.preheader, label %vector.body100.preheader

vector.body100.preheader:                         ; preds = %vector.memcheck121
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100.preheader, %vector.body100
  %index123 = phi i64 [ %index.next124, %vector.body100 ], [ 0, %vector.body100.preheader ]
  %offset.idx128 = or i64 %index123, 1
  %36 = add nsw i64 %offset.idx128, -1
  %37 = getelementptr inbounds double, double* %34, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = getelementptr inbounds double, double* %34, i64 %offset.idx128
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %wide.load133, %wide.load135
  %46 = fadd <2 x double> %wide.load134, %wide.load136
  %47 = add nuw nsw i64 %offset.idx128, 1
  %48 = getelementptr inbounds double, double* %34, i64 %47
  %49 = getelementptr double, double* %48, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !1
  %51 = fadd <2 x double> %45, %wide.load134
  %52 = fadd <2 x double> %46, %wide.load138
  %53 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %54 = fmul <2 x double> %52, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %33, i64 %offset.idx128
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %53, <2 x double>* %56, align 8, !alias.scope !4, !noalias !1
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> %54, <2 x double>* %58, align 8, !alias.scope !4, !noalias !1
  %index.next124 = add i64 %index123, 4
  %59 = icmp eq i64 %index.next124, 1996
  br i1 %59, label %middle.block101, label %vector.body100, !llvm.loop !6

middle.block101:                                  ; preds = %vector.body100
  br i1 false, label %middle.block101.._crit_edge.us_crit_edge, label %._crit_edge23.preheader

middle.block101.._crit_edge.us_crit_edge:         ; preds = %middle.block101
  br label %._crit_edge.us

._crit_edge4.us.loopexit.unr-lcssa:               ; preds = %.lr.ph3.us
  br label %._crit_edge4.us.loopexit

._crit_edge4.us.loopexit:                         ; preds = %.lr.ph3.us.prol.loopexit, %._crit_edge4.us.loopexit.unr-lcssa
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %middle.block64.._crit_edge4.us_crit_edge, %._crit_edge.us.._crit_edge4.us_crit_edge
  %60 = add nsw i32 %35, 1
  %61 = icmp slt i32 %60, 500
  br i1 %61, label %.lr.ph1.us, label %.kernel_jacobi_1d.exit_crit_edge.loopexit

.lr.ph3.us:                                       ; preds = %.lr.ph3.us, %.lr.ph3.us.preheader146.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %.lr.ph3.us.preheader146.new ], [ %indvars.iv.next33.1, %.lr.ph3.us ]
  %62 = add nsw i64 %indvars.iv32, -1
  %63 = getelementptr inbounds double, double* %33, i64 %62
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %33, i64 %indvars.iv32
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %68 = getelementptr inbounds double, double* %33, i64 %indvars.iv.next33
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %71 = fmul double %70, 3.333300e-01
  %72 = getelementptr inbounds double, double* %34, i64 %indvars.iv32
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds double, double* %33, i64 %indvars.iv32
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %33, i64 %indvars.iv.next33
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %78 = getelementptr inbounds double, double* %33, i64 %indvars.iv.next33.1
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %81 = fmul double %80, 3.333300e-01
  %82 = getelementptr inbounds double, double* %34, i64 %indvars.iv.next33
  store double %81, double* %82, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next33, 1998
  br i1 %exitcond.1, label %._crit_edge4.us.loopexit.unr-lcssa, label %.lr.ph3.us, !llvm.loop !9

._crit_edge23:                                    ; preds = %._crit_edge23.preheader, %._crit_edge23
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge23 ], [ %indvars.iv.ph, %._crit_edge23.preheader ]
  %83 = add nsw i64 %indvars.iv, -1
  %84 = getelementptr inbounds double, double* %34, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds double, double* %34, i64 %indvars.iv
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = getelementptr inbounds double, double* %34, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = fmul double %91, 3.333300e-01
  %93 = getelementptr inbounds double, double* %33, i64 %indvars.iv
  store double %92, double* %93, align 8
  %94 = icmp slt i64 %indvars.iv.next, 1999
  br i1 %94, label %._crit_edge23, label %._crit_edge.us.loopexit, !llvm.loop !10

._crit_edge.us.loopexit:                          ; preds = %._crit_edge23
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block101.._crit_edge.us_crit_edge
  br i1 true, label %.lr.ph3.us.preheader, label %._crit_edge.us.._crit_edge4.us_crit_edge

._crit_edge.us.._crit_edge4.us_crit_edge:         ; preds = %._crit_edge.us
  br label %._crit_edge4.us

.lr.ph3.us.preheader:                             ; preds = %._crit_edge.us
  br i1 false, label %.lr.ph3.us.preheader..lr.ph3.us_crit_edge, label %min.iters.checked67

.lr.ph3.us.preheader..lr.ph3.us_crit_edge:        ; preds = %.lr.ph3.us.preheader
  br label %.lr.ph3.us.preheader146

min.iters.checked67:                              ; preds = %.lr.ph3.us.preheader
  br i1 false, label %min.iters.checked67..lr.ph3.us_crit_edge, label %vector.memcheck82

min.iters.checked67..lr.ph3.us_crit_edge:         ; preds = %min.iters.checked67
  br label %.lr.ph3.us.preheader146

.lr.ph3.us.preheader146:                          ; preds = %middle.block64, %vector.memcheck82, %.lr.ph3.us.preheader..lr.ph3.us_crit_edge, %min.iters.checked67..lr.ph3.us_crit_edge
  %indvars.iv32.ph = phi i64 [ 1997, %middle.block64 ], [ 1, %vector.memcheck82 ], [ undef, %min.iters.checked67..lr.ph3.us_crit_edge ], [ undef, %.lr.ph3.us.preheader..lr.ph3.us_crit_edge ]
  %95 = sub i64 1999, %indvars.iv32.ph
  %xtraiter = and i64 %95, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph3.us.prol.loopexit.unr-lcssa, label %.lr.ph3.us.prol.preheader

.lr.ph3.us.prol.preheader:                        ; preds = %.lr.ph3.us.preheader146
  br label %.lr.ph3.us.prol

.lr.ph3.us.prol:                                  ; preds = %.lr.ph3.us.prol.preheader
  %96 = add nsw i64 %indvars.iv32.ph, -1
  %97 = getelementptr inbounds double, double* %33, i64 %96
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %33, i64 %indvars.iv32.ph
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.ph, 1
  %102 = getelementptr inbounds double, double* %33, i64 %indvars.iv.next33.prol
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  %105 = fmul double %104, 3.333300e-01
  %106 = getelementptr inbounds double, double* %34, i64 %indvars.iv32.ph
  store double %105, double* %106, align 8
  br label %.lr.ph3.us.prol.loopexit.unr-lcssa

.lr.ph3.us.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph3.us.preheader146, %.lr.ph3.us.prol
  %indvars.iv32.unr.ph = phi i64 [ %indvars.iv.next33.prol, %.lr.ph3.us.prol ], [ %indvars.iv32.ph, %.lr.ph3.us.preheader146 ]
  br label %.lr.ph3.us.prol.loopexit

.lr.ph3.us.prol.loopexit:                         ; preds = %.lr.ph3.us.prol.loopexit.unr-lcssa
  %107 = icmp eq i64 %indvars.iv32.ph, 1998
  br i1 %107, label %._crit_edge4.us.loopexit, label %.lr.ph3.us.preheader146.new

.lr.ph3.us.preheader146.new:                      ; preds = %.lr.ph3.us.prol.loopexit
  br label %.lr.ph3.us

vector.memcheck82:                                ; preds = %min.iters.checked67
  br i1 %memcheck.conflict81, label %.lr.ph3.us.preheader146, label %vector.body63.preheader

vector.body63.preheader:                          ; preds = %vector.memcheck82
  br label %vector.body63

vector.body63:                                    ; preds = %vector.body63.preheader, %vector.body63
  %index84 = phi i64 [ %index.next85, %vector.body63 ], [ 0, %vector.body63.preheader ]
  %offset.idx89 = or i64 %index84, 1
  %108 = add nsw i64 %offset.idx89, -1
  %109 = getelementptr inbounds double, double* %33, i64 %108
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !11
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !11
  %113 = getelementptr inbounds double, double* %33, i64 %offset.idx89
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !11
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !11
  %117 = fadd <2 x double> %wide.load94, %wide.load96
  %118 = fadd <2 x double> %wide.load95, %wide.load97
  %119 = add nuw nsw i64 %offset.idx89, 1
  %120 = getelementptr inbounds double, double* %33, i64 %119
  %121 = getelementptr double, double* %120, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !11
  %123 = fadd <2 x double> %117, %wide.load95
  %124 = fadd <2 x double> %118, %wide.load99
  %125 = fmul <2 x double> %123, <double 3.333300e-01, double 3.333300e-01>
  %126 = fmul <2 x double> %124, <double 3.333300e-01, double 3.333300e-01>
  %127 = getelementptr inbounds double, double* %34, i64 %offset.idx89
  %128 = bitcast double* %127 to <2 x double>*
  store <2 x double> %125, <2 x double>* %128, align 8, !alias.scope !14, !noalias !11
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  store <2 x double> %126, <2 x double>* %130, align 8, !alias.scope !14, !noalias !11
  %index.next85 = add i64 %index84, 4
  %131 = icmp eq i64 %index.next85, 1996
  br i1 %131, label %middle.block64, label %vector.body63, !llvm.loop !16

middle.block64:                                   ; preds = %vector.body63
  br i1 false, label %middle.block64.._crit_edge4.us_crit_edge, label %.lr.ph3.us.preheader146

middle.block64.._crit_edge4.us_crit_edge:         ; preds = %middle.block64
  br label %._crit_edge4.us

.lr.ph7.split:                                    ; preds = %.lr.ph7
  br i1 undef, label %.lr.ph7.split..lr.ph7.split.split.us_crit_edge, label %.lr.ph7.split.split..kernel_jacobi_1d.exit_crit_edge_crit_edge

.lr.ph7.split..lr.ph7.split.split.us_crit_edge:   ; preds = %.lr.ph7.split
  br label %.lr.ph7.split.split.us

.lr.ph7.split.split.us:                           ; preds = %._crit_edge4.us16, %.lr.ph7.split..lr.ph7.split.split.us_crit_edge
  br i1 undef, label %._crit_edge24.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph7.split.split.us
  br i1 undef, label %._crit_edge24.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %._crit_edge24.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  br i1 true, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  br i1 undef, label %._crit_edge4.us16, label %._crit_edge24.preheader

._crit_edge24.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph7.split.split.us
  br i1 undef, label %._crit_edge24.prol.preheader, label %._crit_edge24.prol.loopexit.unr-lcssa

._crit_edge24.prol.preheader:                     ; preds = %._crit_edge24.preheader
  br label %._crit_edge24.prol

._crit_edge24.prol:                               ; preds = %._crit_edge24.prol.preheader
  br label %._crit_edge24.prol.loopexit.unr-lcssa

._crit_edge24.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge24.preheader, %._crit_edge24.prol
  br label %._crit_edge24.prol.loopexit

._crit_edge24.prol.loopexit:                      ; preds = %._crit_edge24.prol.loopexit.unr-lcssa
  br i1 undef, label %._crit_edge4.us16.loopexit, label %._crit_edge24.preheader.new

._crit_edge24.preheader.new:                      ; preds = %._crit_edge24.prol.loopexit
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24, %._crit_edge24.preheader.new
  br i1 true, label %._crit_edge4.us16.loopexit.unr-lcssa, label %._crit_edge24, !llvm.loop !18

._crit_edge4.us16.loopexit.unr-lcssa:             ; preds = %._crit_edge24
  br label %._crit_edge4.us16.loopexit

._crit_edge4.us16.loopexit:                       ; preds = %._crit_edge24.prol.loopexit, %._crit_edge4.us16.loopexit.unr-lcssa
  br label %._crit_edge4.us16

._crit_edge4.us16:                                ; preds = %._crit_edge4.us16.loopexit, %middle.block
  br i1 false, label %.lr.ph7.split.split.us, label %._crit_edge4.us16..kernel_jacobi_1d.exit_crit_edge_crit_edge

._crit_edge4.us16..kernel_jacobi_1d.exit_crit_edge_crit_edge: ; preds = %._crit_edge4.us16
  br label %.kernel_jacobi_1d.exit_crit_edge

.lr.ph7.split.split..kernel_jacobi_1d.exit_crit_edge_crit_edge: ; preds = %.lr.ph7.split
  br label %.kernel_jacobi_1d.exit_crit_edge

.kernel_jacobi_1d.exit_crit_edge.loopexit:        ; preds = %._crit_edge4.us
  br label %.kernel_jacobi_1d.exit_crit_edge

.kernel_jacobi_1d.exit_crit_edge:                 ; preds = %.kernel_jacobi_1d.exit_crit_edge.loopexit, %._crit_edge4.us16..kernel_jacobi_1d.exit_crit_edge_crit_edge, %.lr.ph7.split.split..kernel_jacobi_1d.exit_crit_edge_crit_edge
  br label %kernel_jacobi_1d.exit

kernel_jacobi_1d.exit:                            ; preds = %init_array.exit.kernel_jacobi_1d.exit_crit_edge, %.kernel_jacobi_1d.exit_crit_edge
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %132 = icmp sgt i32 %0, 42
  br i1 %132, label %133, label %kernel_jacobi_1d.exit._crit_edge

; <label>:133:                                    ; preds = %kernel_jacobi_1d.exit
  %134 = load i8**, i8*** %3, align 8
  %135 = load i8*, i8** %134, align 8
  %strcmpload = load i8, i8* %135, align 1
  %136 = icmp eq i8 %strcmpload, 0
  br i1 %136, label %137, label %kernel_jacobi_1d.exit._crit_edge

; <label>:137:                                    ; preds = %133
  %138 = load double*, double** %.pre-phi, align 8
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %140 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %139) #4
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.lr.ph, label %.print_array.exit_crit_edge

.print_array.exit_crit_edge:                      ; preds = %137
  br label %print_array.exit

.lr.ph:                                           ; preds = %137
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge26, %.lr.ph
  %143 = phi i32 [ %153, %._crit_edge26 ], [ 0, %.lr.ph ]
  %144 = srem i32 %143, 20
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %._crit_edge26

; <label>:146:                                    ; preds = %._crit_edge27
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %147) #4
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge27, %146
  %148 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %149 = sext i32 %143 to i64
  %150 = getelementptr inbounds double, double* %138, i64 %149
  %151 = load double, double* %150, align 8
  %152 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %148, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %151) #5
  %153 = add nsw i32 %143, 1
  %154 = icmp slt i32 %153, 2000
  br i1 %154, label %._crit_edge27, label %print_array.exit.loopexit

print_array.exit.loopexit:                        ; preds = %._crit_edge26
  br label %print_array.exit

print_array.exit:                                 ; preds = %print_array.exit.loopexit, %.print_array.exit_crit_edge
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %156 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %158 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %157) #4
  br label %kernel_jacobi_1d.exit._crit_edge

kernel_jacobi_1d.exit._crit_edge:                 ; preds = %133, %kernel_jacobi_1d.exit, %print_array.exit
  %159 = load i8*, i8** %7, align 8
  call void @free(i8* %159) #3
  %160 = load i8*, i8** %9, align 8
  call void @free(i8* %160) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
