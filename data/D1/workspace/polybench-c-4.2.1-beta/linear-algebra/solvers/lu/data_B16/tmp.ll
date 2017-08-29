; ModuleID = 'A.ll'
source_filename = "lu.c"
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

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = alloca [2000 x double]*, align 8
  %4 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %3, align 8
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader13.lr.ph, label %._crit_edge63.thread

._crit_edge63.thread:                             ; preds = %2
  %6 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %7 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %6, i8** %7, align 8
  br label %.preheader8._crit_edge

.preheader13.lr.ph:                               ; preds = %2
  %8 = sitofp i32 %0 to double
  %9 = add i32 %0, 7
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count136.7 = zext i32 %0 to i64
  %wide.trip.count147 = zext i32 %0 to i64
  %12 = trunc i32 %9 to i3
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %._crit_edge59, %.preheader13.lr.ph
  %indvars.iv155 = phi i3 [ %indvars.iv.next156, %._crit_edge59 ], [ %12, %.preheader13.lr.ph ]
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %._crit_edge59 ], [ 2, %.preheader13.lr.ph ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge59 ], [ 0, %.preheader13.lr.ph ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge59 ], [ 1, %.preheader13.lr.ph ]
  %13 = phi [2000 x double]* [ %.lcssa14, %._crit_edge59 ], [ %1, %.preheader13.lr.ph ]
  %14 = zext i3 %indvars.iv155 to i64
  %15 = add nuw nsw i64 %14, 4294967295
  %16 = and i64 %15, 4294967295
  %17 = add i64 %indvars.iv153, %16
  %18 = sub nsw i64 0, %indvars.iv145
  %19 = trunc i64 %18 to i32
  %20 = trunc i64 %18 to i32
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph52
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %21 ], [ 0, %.lr.ph52 ]
  %22 = sub nsw i64 0, %indvars.iv126
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %0
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = fadd double %26, 1.000000e+00
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv145, i64 %indvars.iv126
  store double %27, double* %28, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next127, %indvars.iv143
  br i1 %exitcond131, label %._crit_edge53, label %21

._crit_edge53:                                    ; preds = %21
  %29 = add i32 %10, %20
  %.pre = load [2000 x double]*, [2000 x double]** %3, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %30 = icmp slt i64 %indvars.iv.next146, %11
  br i1 %30, label %.lr.ph58, label %._crit_edge59

.lr.ph58:                                         ; preds = %._crit_edge53
  %31 = add i32 %9, %19
  %32 = load [2000 x double]*, [2000 x double]** %3, align 8
  %xtraiter140 = and i32 %31, 7
  %lcmp.mod141 = icmp eq i32 %xtraiter140, 0
  br i1 %lcmp.mod141, label %.prol.loopexit139, label %.prol.preheader138.preheader

.prol.preheader138.preheader:                     ; preds = %.lr.ph58
  br label %.prol.preheader138

.prol.preheader138:                               ; preds = %.prol.preheader138.preheader, %.prol.preheader138
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.prol.preheader138 ], [ %indvars.iv143, %.prol.preheader138.preheader ]
  %33 = phi [2000 x double]* [ %32, %.prol.preheader138 ], [ %.pre, %.prol.preheader138.preheader ]
  %prol.iter142 = phi i32 [ %prol.iter142.sub, %.prol.preheader138 ], [ %xtraiter140, %.prol.preheader138.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv145, i64 %indvars.iv134.prol
  store double 0.000000e+00, double* %34, align 8
  %indvars.iv.next135.prol = add nuw nsw i64 %indvars.iv134.prol, 1
  %prol.iter142.sub = add nsw i32 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i32 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %.prol.loopexit139.loopexit, label %.prol.preheader138, !llvm.loop !1

.prol.loopexit139.loopexit:                       ; preds = %.prol.preheader138
  br label %.prol.loopexit139

.prol.loopexit139:                                ; preds = %.prol.loopexit139.loopexit, %.lr.ph58
  %indvars.iv134.unr = phi i64 [ %indvars.iv143, %.lr.ph58 ], [ %17, %.prol.loopexit139.loopexit ]
  %.unr = phi [2000 x double]* [ %.pre, %.lr.ph58 ], [ %32, %.prol.loopexit139.loopexit ]
  %35 = icmp ult i32 %29, 7
  br i1 %35, label %._crit_edge59, label %.lr.ph58.new.preheader

.lr.ph58.new.preheader:                           ; preds = %.prol.loopexit139
  br label %.lr.ph58.new

.lr.ph58.new:                                     ; preds = %.lr.ph58.new.preheader, %.lr.ph58.new
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.7, %.lr.ph58.new ], [ %indvars.iv134.unr, %.lr.ph58.new.preheader ]
  %36 = phi [2000 x double]* [ %32, %.lr.ph58.new ], [ %.unr, %.lr.ph58.new.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i64 %indvars.iv145, i64 %indvars.iv134
  store double 0.000000e+00, double* %37, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135
  store double 0.000000e+00, double* %38, align 8
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.1
  store double 0.000000e+00, double* %39, align 8
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.2
  store double 0.000000e+00, double* %40, align 8
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.3
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next135.4 = add nsw i64 %indvars.iv134, 5
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.4
  store double 0.000000e+00, double* %42, align 8
  %indvars.iv.next135.5 = add nsw i64 %indvars.iv134, 6
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.5
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next135.6 = add nsw i64 %indvars.iv134, 7
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 %indvars.iv145, i64 %indvars.iv.next135.6
  store double 0.000000e+00, double* %44, align 8
  %indvars.iv.next135.7 = add nsw i64 %indvars.iv134, 8
  %exitcond137.7 = icmp eq i64 %indvars.iv.next135.7, %wide.trip.count136.7
  br i1 %exitcond137.7, label %._crit_edge59.loopexit, label %.lr.ph58.new

._crit_edge59.loopexit:                           ; preds = %.lr.ph58.new
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %.prol.loopexit139, %._crit_edge53
  %.lcssa14 = phi [2000 x double]* [ %.pre, %._crit_edge53 ], [ %32, %.prol.loopexit139 ], [ %32, %._crit_edge59.loopexit ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa14, i64 %indvars.iv145, i64 %indvars.iv145
  store double 1.000000e+00, double* %45, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, %wide.trip.count147
  %indvars.iv.next154 = add nuw i64 %indvars.iv153, 1
  %indvars.iv.next156 = add i3 %indvars.iv155, -1
  br i1 %exitcond148, label %._crit_edge63, label %.lr.ph52

._crit_edge63:                                    ; preds = %._crit_edge59
  %46 = icmp sgt i32 %0, 0
  %47 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %48 = bitcast [2000 x [2000 x double]]** %4 to i8**
  store i8* %47, i8** %48, align 8
  br i1 %46, label %.preheader12.us.preheader, label %.preheader8._crit_edge

.preheader12.us.preheader:                        ; preds = %._crit_edge63
  %49 = add i32 %0, -1
  %50 = zext i32 %49 to i64
  %51 = shl nuw nsw i64 %50, 3
  %52 = add nuw nsw i64 %51, 8
  %xtraiter122 = and i32 %0, 3
  %lcmp.mod123 = icmp eq i32 %xtraiter122, 0
  br i1 %lcmp.mod123, label %.preheader12.us.prol.loopexit, label %._crit_edge45.us.prol.preheader

._crit_edge45.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  %53 = add nsw i32 %xtraiter122, -1
  %54 = zext i32 %53 to i64
  %55 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge45.us.prol

._crit_edge45.us.prol:                            ; preds = %._crit_edge45.us.prol.preheader, %._crit_edge45.us.prol
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %._crit_edge45.us.prol ], [ 0, %._crit_edge45.us.prol.preheader ]
  %prol.iter124 = phi i32 [ %prol.iter124.sub, %._crit_edge45.us.prol ], [ %xtraiter122, %._crit_edge45.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv118.prol, i64 0
  %scevgep117.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter124.sub = add nsw i32 %prol.iter124, -1
  %prol.iter124.cmp = icmp eq i32 %prol.iter124.sub, 0
  br i1 %prol.iter124.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge45.us.prol, !llvm.loop !3

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge45.us.prol
  %56 = add nuw nsw i64 %54, 1
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %.preheader12.us.preheader
  %indvars.iv118.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %56, %.preheader12.us.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %49, 3
  br i1 %57, label %.preheader10.us.preheader, label %._crit_edge45.us.3.preheader

._crit_edge45.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %wide.trip.count120.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count120.3, -4
  %59 = sub nsw i64 %58, %indvars.iv118.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod = icmp eq i64 %61, 0
  br i1 %lcmp.mod, label %._crit_edge45.us.3.prol.preheader, label %._crit_edge45.us.3.prol.loopexit

._crit_edge45.us.3.prol.preheader:                ; preds = %._crit_edge45.us.3.preheader
  br label %._crit_edge45.us.3.prol

._crit_edge45.us.3.prol:                          ; preds = %._crit_edge45.us.3.prol.preheader
  %62 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %63 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %64 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %65 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %scevgep.prol159 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv118.unr, i64 0
  %scevgep117.prol160 = bitcast double* %scevgep.prol159 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.prol160, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.prol161 = add nuw nsw i64 %indvars.iv118.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv.next119.prol161, i64 0
  %scevgep117.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.1.prol = add nsw i64 %indvars.iv118.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv.next119.1.prol, i64 0
  %scevgep117.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.2.prol = add nsw i64 %indvars.iv118.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv.next119.2.prol, i64 0
  %scevgep117.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3.prol, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.3.prol = add nsw i64 %indvars.iv118.unr, 4
  br label %._crit_edge45.us.3.prol.loopexit

._crit_edge45.us.3.prol.loopexit:                 ; preds = %._crit_edge45.us.3.prol, %._crit_edge45.us.3.preheader
  %indvars.iv118.unr162 = phi i64 [ %indvars.iv118.unr, %._crit_edge45.us.3.preheader ], [ %indvars.iv.next119.3.prol, %._crit_edge45.us.3.prol ]
  %66 = icmp eq i64 %60, 0
  br i1 %66, label %.preheader11, label %._crit_edge45.us.3.preheader.new

._crit_edge45.us.3.preheader.new:                 ; preds = %._crit_edge45.us.3.prol.loopexit
  %67 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %68 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %71 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %72 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %73 = bitcast i8* %47 to [2000 x [2000 x double]]*
  %74 = bitcast i8* %47 to [2000 x [2000 x double]]*
  br label %._crit_edge45.us.3

.preheader11.unr-lcssa:                           ; preds = %._crit_edge45.us.3
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge45.us.3.prol.loopexit, %.preheader11.unr-lcssa
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.preheader10.us.preheader, label %.preheader8._crit_edge

.preheader10.us.preheader:                        ; preds = %.preheader12.us.prol.loopexit, %.preheader11
  %76 = load [2000 x double]*, [2000 x double]** %3, align 8
  %77 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %4, align 8
  %xtraiter101 = and i32 %0, 1
  %wide.trip.count105 = zext i32 %0 to i64
  %wide.trip.count97.1 = zext i32 %0 to i64
  %wide.trip.count109 = zext i32 %0 to i64
  %78 = icmp eq i32 %xtraiter101, 0
  %79 = icmp eq i32 %0, 1
  %sunkaddr = ptrtoint [2000 x double]* %76 to i64
  br label %.preheader9.lr.ph.us

._crit_edge24.us-lcssa.us.us:                     ; preds = %._crit_edge22.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %.preheader8, label %.preheader9.lr.ph.us

.preheader9.lr.ph.us:                             ; preds = %._crit_edge24.us-lcssa.us.us, %.preheader10.us.preheader
  %indvars.iv107 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next108, %._crit_edge24.us-lcssa.us.us ]
  %sunkaddr150 = shl i64 %indvars.iv107, 3
  %sunkaddr151 = add i64 %sunkaddr, %sunkaddr150
  %sunkaddr152 = inttoptr i64 %sunkaddr151 to double*
  br label %.preheader9.us.us

.preheader9.us.us:                                ; preds = %._crit_edge22.us.us, %.preheader9.lr.ph.us
  %indvars.iv103 = phi i64 [ 0, %.preheader9.lr.ph.us ], [ %indvars.iv.next104, %._crit_edge22.us.us ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv103, i64 %indvars.iv107
  br i1 %78, label %.prol.loopexit100, label %81

; <label>:81:                                     ; preds = %.preheader9.us.us
  %82 = load double, double* %80, align 8
  %83 = load double, double* %sunkaddr152, align 8
  %84 = fmul double %82, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv103, i64 0
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  store double %87, double* %85, align 8
  br label %.prol.loopexit100

.prol.loopexit100:                                ; preds = %.preheader9.us.us, %81
  %indvars.iv95.unr.ph = phi i64 [ 1, %81 ], [ 0, %.preheader9.us.us ]
  br i1 %79, label %._crit_edge22.us.us, label %.preheader9.us.us.new.preheader

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit100
  br label %.preheader9.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit100
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond106, label %._crit_edge24.us-lcssa.us.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new.preheader, %.preheader9.us.us.new
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %.preheader9.us.us.new ], [ %indvars.iv95.unr.ph, %.preheader9.us.us.new.preheader ]
  %88 = load double, double* %80, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv95, i64 %indvars.iv107
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv103, i64 %indvars.iv95
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  store double %94, double* %92, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %95 = load double, double* %80, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %76, i64 %indvars.iv.next96, i64 %indvars.iv107
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next96
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  store double %101, double* %99, align 8
  %indvars.iv.next96.1 = add nuw nsw i64 %indvars.iv95, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count97.1
  br i1 %exitcond98.1, label %._crit_edge22.us.us.loopexit, label %.preheader9.us.us.new

.preheader8:                                      ; preds = %._crit_edge24.us-lcssa.us.us
  %102 = icmp sgt i32 %0, 0
  br i1 %102, label %.preheader.us.preheader, label %.preheader8._crit_edge

.preheader8._crit_edge:                           ; preds = %._crit_edge63, %._crit_edge63.thread, %.preheader11, %.preheader8
  %103 = bitcast [2000 x [2000 x double]]** %4 to i8**
  %.pre83 = load i8*, i8** %103, align 8
  br label %138

.preheader.us.preheader:                          ; preds = %.preheader8
  %104 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %4, align 8
  %105 = load [2000 x double]*, [2000 x double]** %3, align 8
  %106 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count93 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %107 = add nsw i32 %xtraiter, -1
  %108 = zext i32 %107 to i64
  %109 = add nuw nsw i64 %108, 1
  %110 = icmp eq i32 %xtraiter, 0
  %111 = icmp ult i32 %106, 3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next92, %._crit_edge.us ]
  br i1 %110, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv91, i64 %indvars.iv.prol
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv91, i64 %indvars.iv.prol
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !4

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %109, %.prol.loopexit.loopexit ]
  br i1 %111, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv91, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv91, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  %137 = bitcast [2000 x [2000 x double]]* %104 to i8*
  br label %138

; <label>:138:                                    ; preds = %.preheader8._crit_edge, %._crit_edge16
  %139 = phi i8* [ %.pre83, %.preheader8._crit_edge ], [ %137, %._crit_edge16 ]
  tail call void @free(i8* %139) #3
  ret void

._crit_edge45.us.3:                               ; preds = %._crit_edge45.us.3, %._crit_edge45.us.3.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr162, %._crit_edge45.us.3.preheader.new ], [ %indvars.iv.next119.3.1, %._crit_edge45.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv118, i64 0
  %scevgep117 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv.next119, i64 0
  %scevgep117.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv.next119.1, i64 0
  %scevgep117.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.2 = add nsw i64 %indvars.iv118, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv.next119.2, i64 0
  %scevgep117.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.3 = add nsw i64 %indvars.iv118, 4
  %scevgep.1163 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv.next119.3, i64 0
  %scevgep117.1164 = bitcast double* %scevgep.1163 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1164, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.1165 = add nsw i64 %indvars.iv118, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %73, i64 0, i64 %indvars.iv.next119.1165, i64 0
  %scevgep117.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.1.1 = add nsw i64 %indvars.iv118, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv.next119.1.1, i64 0
  %scevgep117.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.2.1 = add nsw i64 %indvars.iv118, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv.next119.2.1, i64 0
  %scevgep117.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3.1, i8 0, i64 %52, i32 8, i1 false)
  %indvars.iv.next119.3.1 = add nsw i64 %indvars.iv118, 8
  %exitcond121.3.1 = icmp eq i64 %indvars.iv.next119.3.1, %wide.trip.count120.3
  br i1 %exitcond121.3.1, label %.preheader11.unr-lcssa, label %._crit_edge45.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = alloca [2000 x double]*, align 8
  store [2000 x double]* %1, [2000 x double]** %3, align 8
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader6.preheader, label %._crit_edge21

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count76 = zext i32 %0 to i64
  %wide.trip.count70 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge16
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge16 ], [ 0, %.preheader6.preheader ]
  %5 = phi [2000 x double]* [ %67, %._crit_edge16 ], [ %1, %.preheader6.preheader ]
  %6 = add nuw i64 %indvars.iv74, 4294967295
  %7 = icmp sgt i64 %indvars.iv74, 0
  br i1 %7, label %.preheader5.preheader, label %.preheader.lr.ph.thread

.preheader5.preheader:                            ; preds = %.preheader6
  br label %.preheader5

.preheader.lr.ph.thread:                          ; preds = %.preheader6
  %8 = load [2000 x double]*, [2000 x double]** %3, align 8
  br label %._crit_edge16

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %9 = phi [2000 x double]* [ %35, %._crit_edge ], [ %5, %.preheader5.preheader ]
  %10 = add nuw i64 %indvars.iv46, 4294967295
  %11 = icmp sgt i64 %indvars.iv46, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv74, i64 %indvars.iv46
  %.pre = load double, double* %12, align 8
  %xtraiter79 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %13

; <label>:13:                                     ; preds = %.lr.ph
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv74, i64 0
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 0, i64 %indvars.iv46
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %13
  %indvars.iv.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %19, %13 ], [ %.pre, %.lr.ph ]
  %20 = trunc i64 %10 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %._crit_edge.loopexit, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %22 = phi double [ %34, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv74, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv, i64 %indvars.iv46
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv74, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv.next, i64 %indvars.iv46
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %._crit_edge.loopexit.loopexit, label %.lr.ph.new

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph.new
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %.prol.loopexit
  %.pre34 = load [2000 x double]*, [2000 x double]** %3, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader5, %._crit_edge.loopexit
  %35 = phi [2000 x double]* [ %.pre34, %._crit_edge.loopexit ], [ %9, %.preheader5 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv46, i64 %indvars.iv46
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i64 %indvars.iv74, i64 %indvars.iv46
  %39 = load double, double* %38, align 8
  %40 = fdiv double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv74
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader5

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %41 = icmp sgt i64 %indvars.iv74, 0
  %42 = load [2000 x double]*, [2000 x double]** %3, align 8
  br i1 %41, label %.preheader.us.preheader, label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter6178 = and i64 %indvars.iv74, 1
  %43 = trunc i64 %6 to i32
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv74, i64 0
  %45 = icmp eq i64 %xtraiter6178, 0
  %46 = icmp eq i32 %43, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge13.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge13.us ], [ %indvars.iv74, %.preheader.us.preheader ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv74, i64 %indvars.iv66
  %.pre35 = load double, double* %47, align 8
  br i1 %45, label %.prol.loopexit60, label %48

; <label>:48:                                     ; preds = %.preheader.us
  %49 = load double, double* %44, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 0, i64 %indvars.iv66
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %.pre35, %52
  store double %53, double* %47, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.preheader.us, %48
  %indvars.iv52.unr.ph = phi i64 [ 1, %48 ], [ 0, %.preheader.us ]
  %.unr63.ph = phi double [ %53, %48 ], [ %.pre35, %.preheader.us ]
  br i1 %46, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit60
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.preheader.us.new ], [ %indvars.iv52.unr.ph, %.preheader.us.new.preheader ]
  %54 = phi double [ %66, %.preheader.us.new ], [ %.unr63.ph, %.preheader.us.new.preheader ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv74, i64 %indvars.iv52
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv52, i64 %indvars.iv66
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %54, %59
  store double %60, double* %47, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv74, i64 %indvars.iv.next53
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv.next53, i64 %indvars.iv66
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %60, %65
  store double %66, double* %47, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv74
  br i1 %exitcond58.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit60
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader.lr.ph.thread, %.preheader.lr.ph
  %67 = phi [2000 x double]* [ %8, %.preheader.lr.ph.thread ], [ %42, %.preheader.lr.ph ], [ %42, %._crit_edge16.loopexit ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.preheader6

._crit_edge21.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv9
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge3.loopexit, label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
