; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.body.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call130 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %0 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call130, i8** %0, align 8
  br label %for.cond78.preheader.for.end99_crit_edge

for.body.lr.ph:                                   ; preds = %entry
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body.lr.ph, %for.end18
  %indvars.iv140 = phi i3 [ -1, %for.body.lr.ph ], [ %indvars.iv.next141, %for.end18 ]
  %indvars.iv138 = phi i64 [ 2, %for.body.lr.ph ], [ %indvars.iv.next139, %for.end18 ]
  %indvars.iv123 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next124, %for.end18 ]
  %indvars.iv121 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next122, %for.end18 ]
  %1 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %.pre, %for.end18 ]
  %2 = zext i3 %indvars.iv140 to i64
  %3 = add nuw nsw i64 %2, 4294967295
  %4 = and i64 %3, 4294967295
  %5 = add i64 %indvars.iv138, %4
  %6 = sub nsw i64 0, %indvars.iv123
  %7 = trunc i64 %6 to i32
  %8 = add i32 2007, %7
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv105 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next106, %for.body3 ]
  %9 = sub nsw i64 0, %indvars.iv105
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv105
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next106, %indvars.iv121
  br i1 %exitcond111, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %11 = add i32 1998, %7
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %cmp959 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %cmp959, label %for.body11.lr.ph, label %for.end18

for.body11.lr.ph:                                 ; preds = %for.end
  %xtraiter118 = and i32 %8, 7
  %lcmp.mod119 = icmp eq i32 %xtraiter118, 0
  br i1 %lcmp.mod119, label %for.body11.prol.loopexit, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.lr.ph
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol.preheader, %for.body11.prol
  %indvars.iv114.prol = phi i64 [ %indvars.iv.next115.prol, %for.body11.prol ], [ %indvars.iv121, %for.body11.prol.preheader ]
  %prol.iter120 = phi i32 [ %prol.iter120.sub, %for.body11.prol ], [ %xtraiter118, %for.body11.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv114.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.prol, 1
  %prol.iter120.sub = add nsw i32 %prol.iter120, -1
  %prol.iter120.cmp = icmp eq i32 %prol.iter120.sub, 0
  br i1 %prol.iter120.cmp, label %for.body11.prol.loopexit.loopexit, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.loopexit:                ; preds = %for.body11.prol
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.loopexit, %for.body11.lr.ph
  %indvars.iv114.unr = phi i64 [ %indvars.iv121, %for.body11.lr.ph ], [ %5, %for.body11.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %11, 7
  br i1 %12, label %for.end18, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.7, %for.body11 ], [ %indvars.iv114.unr, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv114
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next115.2 = add nsw i64 %indvars.iv114, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next115.3 = add nsw i64 %indvars.iv114, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next115.4 = add nsw i64 %indvars.iv114, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next115.5 = add nsw i64 %indvars.iv114, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next115.6 = add nsw i64 %indvars.iv114, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv.next115.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next115.7 = add nsw i64 %indvars.iv114, 8
  %exitcond117.7 = icmp eq i64 %indvars.iv.next115.7, 2000
  br i1 %exitcond117.7, label %for.end18.loopexit, label %for.body11

for.end18.loopexit:                               ; preds = %for.body11
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.body11.prol.loopexit, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 2000
  %indvars.iv.next139 = add nuw i64 %indvars.iv138, 1
  %indvars.iv.next141 = add i3 %indvars.iv140, -1
  br i1 %exitcond126, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %13 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %13, align 8
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  br i1 true, label %for.body29.us.preheader, label %for.end25.for.cond78.preheader.for.end99_crit_edge_crit_edge

for.end25.for.cond78.preheader.for.end99_crit_edge_crit_edge: ; preds = %for.end25
  br label %for.cond78.preheader.for.end99_crit_edge

for.body29.us.preheader:                          ; preds = %for.end25
  br i1 true, label %for.body29.us.prol.loopexit, label %for.body29.us.prol.preheader

for.body29.us.prol.preheader:                     ; preds = %for.body29.us.preheader
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body29.us.prol

for.body29.us.prol:                               ; preds = %for.body29.us.prol.preheader, %for.body29.us.prol
  %indvars.iv97.prol = phi i64 [ %indvars.iv.next98.prol, %for.body29.us.prol ], [ 0, %for.body29.us.prol.preheader ]
  %prol.iter103 = phi i32 [ %prol.iter103.sub, %for.body29.us.prol ], [ 0, %for.body29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv97.prol, i64 0
  %scevgep96.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.prol = add nuw nsw i64 %indvars.iv97.prol, 1
  %prol.iter103.sub = add nsw i32 %prol.iter103, -1
  %prol.iter103.cmp = icmp eq i32 %prol.iter103.sub, 0
  br i1 %prol.iter103.cmp, label %for.body29.us.prol.loopexit.loopexit, label %for.body29.us.prol, !llvm.loop !3

for.body29.us.prol.loopexit.loopexit:             ; preds = %for.body29.us.prol
  br label %for.body29.us.prol.loopexit

for.body29.us.prol.loopexit:                      ; preds = %for.body29.us.prol.loopexit.loopexit, %for.body29.us.preheader
  %indvars.iv97.unr = phi i64 [ 0, %for.body29.us.preheader ], [ 4294967296, %for.body29.us.prol.loopexit.loopexit ]
  br i1 false, label %for.end43, label %for.body29.us.preheader132

for.body29.us.preheader132:                       ; preds = %for.body29.us.prol.loopexit
  %16 = sub nsw i64 1996, %indvars.iv97.unr
  %17 = lshr i64 %16, 2
  %18 = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %18, 0
  br i1 %lcmp.mod, label %for.body29.us.prol.preheader143, label %for.body29.us.prol.loopexit144

for.body29.us.prol.preheader143:                  ; preds = %for.body29.us.preheader132
  br label %for.body29.us.prol145

for.body29.us.prol145:                            ; preds = %for.body29.us.prol.preheader143
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep.prol147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv97.unr, i64 0
  %scevgep96.prol148 = bitcast double* %scevgep.prol147 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.prol148, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.prol149 = add nuw nsw i64 %indvars.iv97.unr, 1
  %scevgep.1.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv.next98.prol149, i64 0
  %scevgep96.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.1.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1.prol = add nsw i64 %indvars.iv97.unr, 2
  %scevgep.2.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv.next98.1.prol, i64 0
  %scevgep96.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.2.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2.prol = add nsw i64 %indvars.iv97.unr, 3
  %scevgep.3.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv.next98.2.prol, i64 0
  %scevgep96.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.3.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3.prol = add nsw i64 %indvars.iv97.unr, 4
  br label %for.body29.us.prol.loopexit144

for.body29.us.prol.loopexit144:                   ; preds = %for.body29.us.prol145, %for.body29.us.preheader132
  %indvars.iv97.unr150 = phi i64 [ %indvars.iv97.unr, %for.body29.us.preheader132 ], [ %indvars.iv.next98.3.prol, %for.body29.us.prol145 ]
  %20 = icmp eq i64 %17, 0
  br i1 %20, label %for.end43.loopexit, label %for.body29.us.preheader132.new

for.body29.us.preheader132.new:                   ; preds = %for.body29.us.prol.loopexit144
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.us.preheader132.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr150, %for.body29.us.preheader132.new ], [ %indvars.iv.next98.3.1, %for.body29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv97, i64 0
  %scevgep96 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv.next98, i64 0
  %scevgep96.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv.next98.1, i64 0
  %scevgep96.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = add nsw i64 %indvars.iv97, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv.next98.2, i64 0
  %scevgep96.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = add nsw i64 %indvars.iv97, 4
  %scevgep.1151 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next98.3, i64 0
  %scevgep96.1152 = bitcast double* %scevgep.1151 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.1152, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1153 = add nsw i64 %indvars.iv97, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next98.1153, i64 0
  %scevgep96.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1.1 = add nsw i64 %indvars.iv97, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next98.1.1, i64 0
  %scevgep96.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2.1 = add nsw i64 %indvars.iv97, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv.next98.2.1, i64 0
  %scevgep96.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep96.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3.1 = add nsw i64 %indvars.iv97, 8
  %exitcond100.3.1 = icmp eq i64 %indvars.iv.next98.3.1, 2000
  br i1 %exitcond100.3.1, label %for.end43.loopexit.unr-lcssa, label %for.body29.us

for.end43.loopexit.unr-lcssa:                     ; preds = %for.body29.us
  br label %for.end43.loopexit

for.end43.loopexit:                               ; preds = %for.body29.us.prol.loopexit144, %for.end43.loopexit.unr-lcssa
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %for.body29.us.prol.loopexit
  br i1 true, label %for.cond48.preheader.us.preheader, label %for.end43.for.cond78.preheader.for.end99_crit_edge_crit_edge

for.end43.for.cond78.preheader.for.end99_crit_edge_crit_edge: ; preds = %for.end43
  br label %for.cond78.preheader.for.end99_crit_edge

for.cond48.preheader.us.preheader:                ; preds = %for.end43
  %sunkaddr = ptrtoint [2000 x double]* %.pre to i64
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count84.pre-phi
  br i1 %exitcond89, label %for.cond78.preheader, label %for.body51.lr.ph.us

for.body51.lr.ph.us:                              ; preds = %for.cond48.preheader.us.preheader, %for.inc75.us
  %indvars.iv86 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next87, %for.inc75.us ]
  %sunkaddr133 = shl nuw nsw i64 %indvars.iv86, 3
  %sunkaddr134 = add i64 %sunkaddr, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to double*
  br label %for.body51.us.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv82 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next83, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv82, i64 %indvars.iv86
  br i1 true, label %for.body55.us.us.prol.loopexit.unr-lcssa, label %for.body55.us.us.prol.preheader

for.body55.us.us.prol.preheader:                  ; preds = %for.body51.us.us
  %23 = load double, double* %arrayidx59.us.us, align 8
  %24 = load double, double* %sunkaddr135, align 8
  %mul.us.us.prol = fmul double %23, %24
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv82, i64 0
  %25 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %mul.us.us.prol, %25
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.body55.us.us.prol.loopexit.unr-lcssa

for.body55.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body51.us.us, %for.body55.us.us.prol.preheader
  %indvars.iv76.unr.ph = phi i64 [ 1, %for.body55.us.us.prol.preheader ], [ 0, %for.body51.us.us ]
  br i1 false, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.preheader

for.body55.us.us.preheader:                       ; preds = %for.body55.us.us.prol.loopexit.unr-lcssa
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.body55.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count84.pre-phi = phi i64 [ 1, %for.body55.us.us.prol.loopexit.unr-lcssa ], [ 2000, %for.cond52.for.inc72_crit_edge.us.us.loopexit ]
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84.pre-phi
  br i1 %exitcond85, label %for.inc75.us, label %for.body51.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.preheader, %for.body55.us.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %for.body55.us.us ], [ %indvars.iv76.unr.ph, %for.body55.us.us.preheader ]
  %26 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv76, i64 %indvars.iv86
  %27 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %26, %27
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv82, i64 %indvars.iv76
  %28 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %28
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %29 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next77, i64 %indvars.iv86
  %30 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %29, %30
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next77
  %31 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %31
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next77.1, 2000
  br i1 %exitcond79.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us

for.cond78.preheader:                             ; preds = %for.inc75.us
  br i1 true, label %for.body81.us.preheader, label %for.cond78.preheader.for.cond78.preheader.for.end99_crit_edge_crit_edge

for.cond78.preheader.for.cond78.preheader.for.end99_crit_edge_crit_edge: ; preds = %for.cond78.preheader
  br label %for.cond78.preheader.for.end99_crit_edge

for.cond78.preheader.for.end99_crit_edge:         ; preds = %for.cond78.preheader.for.cond78.preheader.for.end99_crit_edge_crit_edge, %for.end43.for.cond78.preheader.for.end99_crit_edge_crit_edge, %for.end25.for.cond78.preheader.for.end99_crit_edge_crit_edge, %for.end25.thread
  %.pre69 = phi i8* [ undef, %for.cond78.preheader.for.cond78.preheader.for.end99_crit_edge_crit_edge ], [ %call, %for.end43.for.cond78.preheader.for.end99_crit_edge_crit_edge ], [ %call, %for.end25.for.cond78.preheader.for.end99_crit_edge_crit_edge ], [ %call130, %for.end25.thread ]
  br label %for.end99

for.body81.us.preheader:                          ; preds = %for.cond78.preheader
  %32 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %33 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us, %for.body81.us.preheader
  %indvars.iv72 = phi i64 [ 0, %for.body81.us.preheader ], [ %indvars.iv.next73, %for.cond82.for.inc97_crit_edge.us ]
  br i1 true, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.body81.us
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol.preheader, %for.body85.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ 0, %for.body85.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body85.us.prol ], [ 0, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv72, i64 %indvars.iv.prol
  %34 = bitcast double* %arrayidx89.us.prol to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv72, i64 %indvars.iv.prol
  %36 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.loopexit, label %for.body85.us.prol, !llvm.loop !4

for.body85.us.prol.loopexit.loopexit:             ; preds = %for.body85.us.prol
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.prol.loopexit.loopexit, %for.body81.us
  %indvars.iv.unr = phi i64 [ 0, %for.body81.us ], [ 4294967296, %for.body85.us.prol.loopexit.loopexit ]
  br i1 false, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.preheader, %for.body85.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85.us ], [ %indvars.iv.unr, %for.body85.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv72, i64 %indvars.iv
  %37 = bitcast double* %arrayidx89.us to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv72, i64 %indvars.iv
  %39 = bitcast double* %arrayidx93.us to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next
  %40 = bitcast double* %arrayidx89.us.1 to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv72, i64 %indvars.iv.next
  %42 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %43 = bitcast double* %arrayidx89.us.2 to i64*
  %44 = load i64, i64* %43, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %45 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %44, i64* %45, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %46 = bitcast double* %arrayidx89.us.3 to i64*
  %47 = load i64, i64* %46, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %48 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %47, i64* %48, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.body85.us.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond, label %for.end99.loopexit, label %for.body81.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %49 = bitcast [2000 x [2000 x double]]* %32 to i8*
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader.for.end99_crit_edge
  %50 = phi i8* [ %.pre69, %for.cond78.preheader.for.end99_crit_edge ], [ %49, %for.end99.loopexit ]
  tail call void @free(i8* %50) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_lu(i32 %n, [2000 x double]* %A) #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.body.preheader, label %for.end56

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc54
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc54 ], [ 0, %for.body.preheader ]
  %0 = phi [2000 x double]* [ %27, %for.inc54 ], [ %A, %for.body.preheader ]
  %1 = add nuw i64 %indvars.iv55, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv55, 0
  br i1 %cmp23, label %for.body3.preheader, label %for.body30.lr.ph.thread

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body30.lr.ph.thread:                          ; preds = %for.body
  br label %for.inc54

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.end ], [ 0, %for.body3.preheader ]
  %2 = phi [2000 x double]* [ %13, %for.end ], [ %0, %for.body3.preheader ]
  %3 = add nuw i64 %indvars.iv29, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.body3
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv55, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter60 = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter60, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv55, i64 0
  %4 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 0, i64 %indvars.iv29
  %5 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %4, %5
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %6 = trunc i64 %3 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %for.body6.for.end_crit_edge, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %8 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv55, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv29
  %10 = load double, double* %arrayidx12, align 8
  %mul = fmul double %9, %10
  %sub = fsub double %8, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv55, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv29
  %12 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %11, %12
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %for.body6.for.end_crit_edge.loopexit, label %for.body6

for.body6.for.end_crit_edge.loopexit:             ; preds = %for.body6
  br label %for.body6.for.end_crit_edge

for.body6.for.end_crit_edge:                      ; preds = %for.body6.for.end_crit_edge.loopexit, %for.body6.prol.loopexit.unr-lcssa
  %.pre19 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body3, %for.body6.for.end_crit_edge
  %13 = phi [2000 x double]* [ %.pre19, %for.body6.for.end_crit_edge ], [ %2, %for.body3 ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv29
  %14 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv55, i64 %indvars.iv29
  %15 = load double, double* %arrayidx24, align 8
  %div = fdiv double %15, %14
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %indvars.iv55
  br i1 %exitcond, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  %16 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter4259 = and i64 %indvars.iv55, 1
  %17 = trunc i64 %1 to i32
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv55, i64 0
  %18 = icmp eq i64 %xtraiter4259, 0
  %19 = icmp eq i32 %17, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv55, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv55, i64 %indvars.iv47
  %.pre20 = load double, double* %arrayidx46.us, align 8
  br i1 %18, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.body30.us
  %20 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 0, i64 %indvars.iv47
  %21 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %20, %21
  %sub47.us.prol = fsub double %.pre20, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.body30.us, %for.body33.us.prol.preheader
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.body33.us.prol.preheader ], [ 0, %for.body30.us ]
  %.unr44.ph = phi double [ %sub47.us.prol, %for.body33.us.prol.preheader ], [ %.pre20, %for.body30.us ]
  br i1 %19, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %for.body33.us ], [ %indvars.iv35.unr.ph, %for.body33.us.preheader ]
  %22 = phi double [ %sub47.us.1, %for.body33.us ], [ %.unr44.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv55, i64 %indvars.iv35
  %23 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv35, i64 %indvars.iv47
  %24 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %23, %24
  %sub47.us = fsub double %22, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv55, i64 %indvars.iv.next36
  %25 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv.next36, i64 %indvars.iv47
  %26 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %25, %26
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next36.1, %indvars.iv55
  br i1 %exitcond41.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit.unr-lcssa
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond52, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.body30.lr.ph.for.inc54_crit_edge, %for.body30.lr.ph.thread
  %27 = phi [2000 x double]* [ %0, %for.body30.lr.ph.thread ], [ undef, %for.body30.lr.ph.for.inc54_crit_edge ], [ %16, %for.inc54.loopexit ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond58, label %for.end56.loopexit, label %for.body

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 2000, %indvars.iv8
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
